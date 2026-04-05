import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'timer_sound_player.dart';

/// Короткий сигнал (тип А): за 3…1 с до конца фазы — встроенный WAV + тактильно.
void playWorkoutTimerShortWarning() {
  try {
    HapticFeedback.lightImpact();
    IronVibeTimerSounds.playTick();
  } catch (_) {}
}

/// Сигнал смены фазы (тип Б): двойной тон в одном WAV + тактильно под второй удар.
void playWorkoutTimerPhaseTransition() {
  try {
    HapticFeedback.heavyImpact();
    IronVibeTimerSounds.playPhase();
    Future<void>.delayed(const Duration(milliseconds: 88), () {
      try {
        HapticFeedback.mediumImpact();
      } catch (_) {}
    });
  } catch (_) {}
}

/// Режим отображения: секундомер вверх, обратный отсчёт, интервалы.
enum WorkoutTimerMode { stopwatch, countdown, interval }

/// Логика таймера (тик, интервалы, пресеты отдыха) отдельно от UI.
class WorkoutTimerController extends ChangeNotifier {
  WorkoutTimerController() : super();

  static const int _tickMs = 100;

  Timer? _timer;

  /// Запущен ли мотор тиков (пауза выключает таймер ОС, состояние сохраняется).
  bool running = false;

  WorkoutTimerMode mode = WorkoutTimerMode.stopwatch;

  int stopwatchElapsedMs = 0;

  int countdownRemainingMs = 0;
  int countdownTotalMs = 0;

  int intervalWorkMs = 60000;
  int intervalRestMs = 60000;
  bool intervalIsWork = true;
  int intervalPhaseRemainingMs = 0;
  int intervalPhaseTotalMs = 0;

  int? _warnCeilSec;

  int get displayMs {
    switch (mode) {
      case WorkoutTimerMode.stopwatch:
        return stopwatchElapsedMs;
      case WorkoutTimerMode.countdown:
        return countdownRemainingMs.clamp(0, 86400000);
      case WorkoutTimerMode.interval:
        return intervalPhaseRemainingMs.clamp(0, intervalPhaseTotalMs > 0 ? intervalPhaseTotalMs : 86400000);
    }
  }

  /// Оставшаяся доля текущей фазы (для прогресс-бара). null — в режиме секундомера.
  double? get phaseProgress {
    switch (mode) {
      case WorkoutTimerMode.countdown:
        if (countdownTotalMs <= 0) return null;
        return (countdownRemainingMs / countdownTotalMs).clamp(0.0, 1.0);
      case WorkoutTimerMode.interval:
        if (intervalPhaseTotalMs <= 0) return null;
        return (intervalPhaseRemainingMs / intervalPhaseTotalMs).clamp(0.0, 1.0);
      case WorkoutTimerMode.stopwatch:
        return null;
    }
  }

  void _startMotor() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: _tickMs), (_) => _onTick());
  }

  void _stopMotor() {
    _timer?.cancel();
    _timer = null;
  }

  void _onTick() {
    if (!running) return;
    switch (mode) {
      case WorkoutTimerMode.stopwatch:
        stopwatchElapsedMs += _tickMs;
        break;
      case WorkoutTimerMode.countdown:
        countdownRemainingMs -= _tickMs;
        if (countdownRemainingMs <= 0) {
          countdownRemainingMs = 0;
          running = false;
          _stopMotor();
          _warnCeilSec = null;
          playWorkoutTimerPhaseTransition();
        } else {
          _checkPhaseWarnings(countdownRemainingMs);
        }
        break;
      case WorkoutTimerMode.interval:
        intervalPhaseRemainingMs -= _tickMs;
        if (intervalPhaseRemainingMs <= 0) {
          _flipIntervalPhase();
        } else {
          _checkPhaseWarnings(intervalPhaseRemainingMs);
        }
        break;
    }
    notifyListeners();
  }

  void _checkPhaseWarnings(int remainingMs) {
    if (remainingMs > 3000) {
      _warnCeilSec = null;
      return;
    }
    final ceilSec = (remainingMs + 999) ~/ 1000;
    if (ceilSec >= 1 && ceilSec <= 3 && ceilSec != _warnCeilSec) {
      _warnCeilSec = ceilSec;
      playWorkoutTimerShortWarning();
    }
  }

  void _flipIntervalPhase() {
    _warnCeilSec = null;
    playWorkoutTimerPhaseTransition();
    intervalIsWork = !intervalIsWork;
    if (intervalIsWork) {
      intervalPhaseRemainingMs = intervalWorkMs;
      intervalPhaseTotalMs = intervalWorkMs;
    } else {
      intervalPhaseRemainingMs = intervalRestMs;
      intervalPhaseTotalMs = intervalRestMs;
    }
  }

  /// Интервальный цикл: workSec / restSec, бесконечно до паузы или сброса.
  void startIntervalPreset({required int workSec, required int restSec}) {
    _stopMotor();
    mode = WorkoutTimerMode.interval;
    intervalWorkMs = workSec * 1000;
    intervalRestMs = restSec * 1000;
    intervalIsWork = true;
    intervalPhaseRemainingMs = intervalWorkMs;
    intervalPhaseTotalMs = intervalWorkMs;
    stopwatchElapsedMs = 0;
    countdownRemainingMs = 0;
    countdownTotalMs = 0;
    _warnCeilSec = null;
    running = true;
    _startMotor();
    notifyListeners();
  }

  /// Пресеты отдыха: обратный отсчёт; к уже идущему отсчёту время прибавляется; интервал при этом сбрасывается.
  void addRestMinutes(int minutes) {
    final addMs = minutes * 60 * 1000;
    _warnCeilSec = null;

    if (mode == WorkoutTimerMode.interval) {
      _stopMotor();
      mode = WorkoutTimerMode.countdown;
      countdownRemainingMs = addMs;
      countdownTotalMs = addMs;
      running = true;
      _startMotor();
      notifyListeners();
      return;
    }

    if (mode == WorkoutTimerMode.countdown) {
      if (running) {
        countdownRemainingMs += addMs;
      } else {
        if (countdownRemainingMs <= 0) {
          countdownRemainingMs = addMs;
        } else {
          countdownRemainingMs += addMs;
        }
      }
      countdownTotalMs = countdownRemainingMs;
      notifyListeners();
      return;
    }

    _stopMotor();
    mode = WorkoutTimerMode.countdown;
    countdownRemainingMs = addMs;
    countdownTotalMs = addMs;
    running = true;
    stopwatchElapsedMs = 0;
    _startMotor();
    notifyListeners();
  }

  void toggleRunning() {
    if (mode == WorkoutTimerMode.countdown && countdownRemainingMs <= 0) {
      return;
    }
    if (mode == WorkoutTimerMode.interval && !running && intervalPhaseRemainingMs <= 0 && intervalPhaseTotalMs <= 0) {
      return;
    }
    if (running) {
      running = false;
      _stopMotor();
    } else {
      running = true;
      _startMotor();
    }
    notifyListeners();
  }

  void resetAll() {
    _stopMotor();
    running = false;
    mode = WorkoutTimerMode.stopwatch;
    stopwatchElapsedMs = 0;
    countdownRemainingMs = 0;
    countdownTotalMs = 0;
    intervalPhaseRemainingMs = 0;
    intervalPhaseTotalMs = 0;
    intervalIsWork = true;
    _warnCeilSec = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _stopMotor();
    super.dispose();
  }
}
