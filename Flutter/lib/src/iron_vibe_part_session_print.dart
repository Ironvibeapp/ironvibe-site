part of 'package:fitness_app/main.dart';

const PdfColor _kPrintSteel = PdfColor.fromInt(0xFF2A3140);
const PdfColor _kPrintGold = PdfColor.fromInt(0xFFC4A06A);

const String _kPrintFontRegular = 'assets/fonts/NotoSans-Regular.ttf';
const String _kPrintFontBold = 'assets/fonts/NotoSans-Bold.ttf';
const String _kPrintFontSc = 'assets/fonts/NotoSansSC-Regular.ttf';
const String _kPrintLogoAsset = 'assets/logo_on_light.svg';

pw.Font? _printFontRegular;
pw.Font? _printFontBold;
pw.Font? _printFontSc;
Uint8List? _printLogoPng;

class IronVibeSessionPrintRow {
  final String name;
  final String detail;

  const IronVibeSessionPrintRow({required this.name, required this.detail});
}

/// One paper row per named exercise that has at least one filled set.
/// Strength: weight×reps only (RIR stays off the sheet). Cardio: time · intensity.
List<IronVibeSessionPrintRow> ironVibeSessionPrintRows(TrainerSession session) {
  final rows = <IronVibeSessionPrintRow>[];
  for (final ex in session.exercises) {
    final name = normalizeExerciseName(ex.name);
    if (name.isEmpty) continue;
    final detail = ex.isCardio
        ? _printCardioDetail(ex)
        : _printStrengthDetail(ex);
    if (detail.isEmpty) continue;
    rows.add(IronVibeSessionPrintRow(name: name, detail: detail));
  }
  return rows;
}

String ironVibeSessionPrintWhen(DateTime date) {
  final dateStr =
      '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  final timeStr =
      '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  return '$dateStr · $timeStr';
}

String ironVibeSessionPrintFileStem(String clientName, DateTime date) {
  var cleaned = clientName
      .replaceAll(RegExp(r'[\\/:*?"<>|]'), '')
      .trim()
      .replaceAll(RegExp(r'\s+'), '_');
  if (cleaned.isEmpty) cleaned = 'Client';
  if (cleaned.length > 40) cleaned = cleaned.substring(0, 40);
  final datePart =
      '${date.year}_${date.month.toString().padLeft(2, '0')}_${date.day.toString().padLeft(2, '0')}';
  return 'IronVibe_${cleaned}_$datePart';
}

String _printStrengthDetail(ExerciseLog ex) {
  final parts = <String>[];
  for (final s in ex.sets) {
    if (s.isCardio) continue;
    final w = s.weight.trim();
    final r = s.reps.trim();
    if (w.isEmpty && r.isEmpty) continue;
    if (w.isEmpty) {
      parts.add(r);
    } else if (r.isEmpty) {
      parts.add(w);
    } else {
      parts.add('$w×$r');
    }
  }
  return parts.join('  ·  ');
}

String _printCardioDetail(ExerciseLog ex) {
  final parts = <String>[];
  for (final s in ex.sets) {
    final bits = <String>[];
    final d = s.duration.trim();
    final i = s.intensity.trim();
    if (d.isNotEmpty) bits.add(d);
    if (i.isNotEmpty) bits.add(i);
    if (bits.isNotEmpty) parts.add(bits.join(' · '));
  }
  return parts.join('  ·  ');
}

Future<void> _ensurePrintAssets() async {
  _printFontRegular ??= pw.Font.ttf(await rootBundle.load(_kPrintFontRegular));
  _printFontBold ??= pw.Font.ttf(await rootBundle.load(_kPrintFontBold));
  _printFontSc ??= pw.Font.ttf(await rootBundle.load(_kPrintFontSc));
  _printLogoPng ??= await _rasterizePrintLogo();
}

Future<Uint8List> _rasterizePrintLogo() async {
  const width = 400;
  const height = 560;
  final pictureInfo = await vg.loadPicture(
    const SvgAssetLoader(_kPrintLogoAsset),
    null,
  );
  try {
    final image = await pictureInfo.picture.toImage(width, height);
    try {
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      if (bytes == null) {
        throw StateError('Could not rasterize print logo');
      }
      return bytes.buffer.asUint8List();
    } finally {
      image.dispose();
    }
  } finally {
    pictureInfo.picture.dispose();
  }
}

Future<Uint8List> ironVibeBuildSessionPdfBytes({
  required TrainerSession session,
  required AppLocalizations l,
}) async {
  await _ensurePrintAssets();
  final rows = ironVibeSessionPrintRows(session);
  final logo = pw.MemoryImage(_printLogoPng!);
  final theme = pw.ThemeData.withFont(
    base: _printFontRegular!,
    bold: _printFontBold!,
    fontFallback: [_printFontSc!],
  );

  final doc = pw.Document();
  doc.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.fromLTRB(48, 36, 48, 40),
      theme: theme,
      header: (context) => context.pageNumber == 1
          ? pw.SizedBox()
          : _printContinuationHeader(session),
      footer: (context) => _printFooter(context),
      build: (context) => [
        _printBrandHeader(session, l, logo),
        pw.SizedBox(height: 18),
        _printExerciseTable(rows, l),
      ],
    ),
  );
  return doc.save();
}

pw.Widget _printBrandHeader(
  TrainerSession session,
  AppLocalizations l,
  pw.ImageProvider logo,
) {
  final note = session.note.trim();
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
    children: [
      pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Image(
            logo,
            height: 22 * PdfPageFormat.mm,
            fit: pw.BoxFit.contain,
          ),
          pw.SizedBox(width: 14),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  l.appName,
                  style: pw.TextStyle(
                    color: _kPrintSteel,
                    fontSize: 22,
                    fontWeight: pw.FontWeight.bold,
                    letterSpacing: 0.4,
                  ),
                ),
                pw.SizedBox(height: 6),
                pw.Text(
                  session.clientName,
                  style: pw.TextStyle(
                    color: _kPrintSteel,
                    fontSize: 13,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 2),
                pw.Text(
                  ironVibeSessionPrintWhen(session.dateTime),
                  style: const pw.TextStyle(
                    color: _kPrintSteel,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      pw.SizedBox(height: 10),
      pw.Container(height: 0.6, color: _kPrintGold),
      if (note.isNotEmpty) ...[
        pw.SizedBox(height: 8),
        pw.Text(
          note,
          style: const pw.TextStyle(color: _kPrintSteel, fontSize: 10),
        ),
      ],
    ],
  );
}

pw.Widget _printContinuationHeader(TrainerSession session) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 10),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.stretch,
      children: [
        pw.Text(
          '${session.clientName}  ·  ${ironVibeSessionPrintWhen(session.dateTime)}',
          style: const pw.TextStyle(color: _kPrintSteel, fontSize: 9),
        ),
        pw.SizedBox(height: 4),
        pw.Container(height: 0.4, color: _kPrintGold),
      ],
    ),
  );
}

pw.Widget _printFooter(pw.Context context) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(top: 8),
    child: pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Text(
        '${context.pageNumber} / ${context.pagesCount}',
        style: const pw.TextStyle(color: _kPrintSteel, fontSize: 8),
      ),
    ),
  );
}

pw.Widget _printExerciseTable(
  List<IronVibeSessionPrintRow> rows,
  AppLocalizations l,
) {
  pw.Widget cell(String text, {bool bold = false, bool header = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          color: _kPrintSteel,
          fontSize: header ? 9 : 10.5,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          letterSpacing: header ? 0.4 : 0,
        ),
      ),
    );
  }

  return pw.Table(
    border: const pw.TableBorder(
      horizontalInside: pw.BorderSide(color: _kPrintSteel, width: 0.25),
    ),
    columnWidths: const {
      0: pw.FlexColumnWidth(1.15),
      1: pw.FlexColumnWidth(1.85),
    },
    children: [
      pw.TableRow(
        children: [
          cell(l.exerciseHeader, bold: true, header: true),
          cell(l.sets, bold: true, header: true),
        ],
      ),
      ...rows.map(
        (row) => pw.TableRow(
          children: [
            cell(row.name, bold: true),
            cell(row.detail),
          ],
        ),
      ),
    ],
  );
}

Future<void> ironVibeShareSessionPdf(
  BuildContext context,
  TrainerSession session,
) async {
  final l = AppLocalizations.of(context)!;
  final pal = IronVibePalette.of(context);
  var loadingOpen = false;

  try {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: CircularProgressIndicator(color: pal.iconPrimary),
          ),
        );
      },
    );
    loadingOpen = true;

    final bytes = await ironVibeBuildSessionPdfBytes(session: session, l: l);
    final directory = await getTemporaryDirectory();
    final stem = ironVibeSessionPrintFileStem(
      session.clientName,
      session.dateTime,
    );
    await _cleanOldExportFiles(directory, 'IronVibe_*.pdf');
    final safeFileName = '$stem.pdf';
    final path = '${directory.path}/$safeFileName';
    await File(path).writeAsBytes(bytes, flush: true);

    if (!context.mounted) {
      await _deleteExportFile(path);
      return;
    }
    Navigator.of(context).pop();
    loadingOpen = false;

    try {
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(path, mimeType: 'application/pdf', name: safeFileName)],
          text: l.printSessionShareText,
        ),
      );
    } catch (shareError) {
      debugPrint('Share session PDF error: $shareError');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l.exportError} $shareError'),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      await _deleteExportFile(path);
    }
  } catch (e) {
    debugPrint('Build session PDF error: $e');
    if (loadingOpen && context.mounted) {
      Navigator.of(context).pop();
    }
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${l.exportError} $e'),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
