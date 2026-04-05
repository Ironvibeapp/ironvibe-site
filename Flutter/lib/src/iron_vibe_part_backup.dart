part of 'package:fitness_app/main.dart';

Future<void> _exportToJson(BuildContext context, bool isTrainer) async {
  final locale = AppLocalizations.of(context)!;
  try {
    const uuid = Uuid();
    if (!isTrainer) {
      for (var w in workoutHistory) {
        w.id ??= uuid.v4();
      }
    } else {
      for (var s in trainerSchedule) {
        s.id ??= uuid.v4();
      }
    }
    await DataService.saveData();

    final Map<String, dynamic> payload = {
      'version': _kExportDataVersion,
      'exerciseBank': exerciseBank,
      if (!isTrainer) 'workoutHistory': workoutHistory.map((e) => e.toJson()).toList(),
      if (isTrainer) ...{
        'clients': clients.map((e) => e.toJson()).toList(),
        'trainerSchedule': trainerSchedule.map((e) => e.toJson()).toList(),
      },
    };

    if (!context.mounted) return;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        final pal = IronVibePalette.of(ctx);
        return Center(
          child: Material(
            color: Colors.transparent,
            child: CircularProgressIndicator(color: pal.iconPrimary),
          ),
        );
      },
    );

    final jsonString = await compute(_encodeJsonPayload, payload);

    final directory = await getTemporaryDirectory();
    final now = DateTime.now();
    final datePart = '${now.year}_${now.month.toString().padLeft(2, '0')}_${now.day.toString().padLeft(2, '0')}';
    final baseName = isTrainer ? 'IronVibe_Backup_Coach' : 'IronVibe_Backup';
    await _cleanOldExportFiles(directory, 'IronVibe_Backup*.json');
    final safeFileName = '${baseName}_$datePart.json';
    final path = '${directory.path}/$safeFileName';

    final file = File(path);
    await file.writeAsString(jsonString, flush: true);

    if (!context.mounted) return;
    Navigator.of(context).pop();
    if (!context.mounted) return;
    Navigator.of(context).pop();

    try {
      await SharePlus.instance.share(
        ShareParams(
          files: [
            XFile(path, mimeType: 'application/json', name: safeFileName),
          ],
          text: locale.shareText,
        ),
      );
      await _deleteExportFile(path);
    } catch (shareError) {
      debugPrint('Share error: $shareError');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${locale.exportError} $shareError'),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      await _deleteExportFile(path);
    }
  } catch (e) {
    debugPrint('Export JSON Error: $e');
    if (context.mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${locale.exportError} $e'),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

Future<void> _importFromJson(BuildContext context, bool isTrainer) async {
  final locale = AppLocalizations.of(context)!;
  void showError(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );
    if (result == null || result.files.isEmpty) return;

    final file = result.files.single;
    final name = file.name.toLowerCase();
    if (!name.endsWith('.json')) {
      showError(locale.importInvalidBackupFile);
      return;
    }
    final bytes = file.bytes;
    if (bytes == null || bytes.isEmpty) {
      showError(locale.importInvalidBackupFile);
      return;
    }

    String content;
    try {
      content = utf8.decode(bytes);
    } catch (_) {
      showError(locale.importInvalidBackupFile);
      return;
    }

    Map<String, dynamic> data;
    try {
      final decoded = jsonDecode(content);
      if (decoded is! Map<String, dynamic>) {
        showError(locale.importInvalidBackupFile);
        return;
      }
      data = decoded;
    } on FormatException {
      showError(locale.importInvalidBackupFile);
      return;
    }

    final version = data['version'] as int? ?? 1;
    if (version > _kExportDataVersion && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(locale.importNewerVersion),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    final existingWorkoutIds = workoutHistory.map((w) => w.id).whereType<String>().toSet();
    final existingSessionIds = trainerSchedule.map((s) => s.id).whereType<String>().toSet();
    final existingClientNames = clients.map((c) => c.name).toSet();

    try {
      if (!isTrainer) {
        final list = data['workoutHistory'] as List? ?? [];
        for (var item in list) {
          final map = _jsonMap(item);
          if (map == null) continue;
          final id = map['id'] as String?;
          if (id != null && existingWorkoutIds.contains(id)) continue;
          final w = WorkoutLog.fromJson(map);
          if (w.id != null) existingWorkoutIds.add(w.id!);
          workoutHistory.add(w);
        }
      } else {
        final clientList = data['clients'] as List? ?? [];
        for (var item in clientList) {
          final map = _jsonMap(item);
          if (map == null) continue;
          final c = Client.fromJson(map);
          if (existingClientNames.contains(c.name)) continue;
          existingClientNames.add(c.name);
          clients.add(c);
        }
        final scheduleList = data['trainerSchedule'] as List? ?? [];
        for (var item in scheduleList) {
          final map = _jsonMap(item);
          if (map == null) continue;
          final id = map['id'] as String?;
          if (id != null && existingSessionIds.contains(id)) continue;
          final s = TrainerSession.fromJson(map);
          if (s.id != null) existingSessionIds.add(s.id!);
          trainerSchedule.add(s);
        }
      }

      final bank = data['exerciseBank'] as List? ?? [];
      for (var name in bank) {
        final s = normalizeExerciseName(name is String ? name : name.toString());
        if (s.isNotEmpty) ensureExerciseInBank(s);
      }

      exerciseBank = _dedupeNormalizedExerciseBank(exerciseBank);
      workoutHistory = workoutHistory.map(_normalizeWorkoutLogExerciseNames).toList();
      trainerSchedule = trainerSchedule.map(_normalizeTrainerSessionExerciseNames).toList();

      if (!isTrainer) {
        workoutHistory.sort((a, b) => a.date.compareTo(b.date));
      } else {
        trainerSchedule.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      }
      await DataService.saveData();

      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(locale.importSuccess),
            backgroundColor: Colors.green[700],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e, stack) {
      debugPrint('Import parse error: $e\n$stack');
      showError(locale.importInvalidBackupFile);
    }
  } catch (e, stack) {
    debugPrint('Import error: $e\n$stack');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(locale.importInvalidBackupFile),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}

void _showStatistics(BuildContext context, bool isTrainer) {
  final now = DateTime.now();
  int monthCount = 0;
  int yearCount = 0;
  int totalCount = 0;

  if (isTrainer) {
    totalCount = trainerSchedule.length;
    for (var s in trainerSchedule) {
      if (s.dateTime.year == now.year && s.dateTime.month == now.month) {
        monthCount++;
      }
      if (s.dateTime.year == now.year) {
        yearCount++;
      }
    }
  } else {
    totalCount = workoutHistory.length;
    for (var w in workoutHistory) {
      if (w.date.year == now.year && w.date.month == now.month) {
        monthCount++;
      }
      if (w.date.year == now.year) {
        yearCount++;
      }
    }
  }

  showDialog(
    context: context,
    builder: (ctx) {
      final pal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: pal.dialog,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: pal.borderDefault, width: 0.5),
          borderRadius: BorderRadius.zero,
        ),
        title: Center(
          child: Text(
            AppLocalizations.of(ctx)!.statistics,
            style: TextStyle(color: pal.textPrimary, fontWeight: FontWeight.bold, letterSpacing: 2.0),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            _buildStatItem(ctx, AppLocalizations.of(ctx)!.monthStats, '$monthCount'),
            const SizedBox(height: 20),
            _buildStatItem(ctx, AppLocalizations.of(ctx)!.yearStats, '$yearCount'),
            const SizedBox(height: 20),
            _buildStatItem(ctx, AppLocalizations.of(ctx)!.allTimeStats, '$totalCount'),
            const SizedBox(height: 40),
            SteelButton(
              text: AppLocalizations.of(ctx)!.exportHistory,
              onPressed: () => _exportToJson(ctx, isTrainer),
              width: double.infinity,
              height: 45,
              fontSize: 11,
            ),
            const SizedBox(height: 10),
            SteelButton(
              text: AppLocalizations.of(ctx)!.importData,
              onPressed: () => _importFromJson(ctx, isTrainer),
              width: double.infinity,
              height: 45,
              fontSize: 11,
            ),
            const SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(AppLocalizations.of(ctx)!.close, style: TextStyle(color: pal.textPrimary)),
          ),
        ],
      );
    },
  );
}

Widget _buildStatItem(BuildContext context, String label, String value) {
  final pal = IronVibePalette.of(context);
  final bigColor = pal.brightness == Brightness.dark ? const Color(0xFFB0BEC5) : pal.iconPrimary;
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          color: bigColor,
          fontSize: 48,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.0,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          color: pal.textMuted,
          fontSize: 12,
          letterSpacing: 1.5,
        ),
      ),
    ],
  );
}
