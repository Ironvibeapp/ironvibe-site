import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Встроенные короткие сигналы таймера (WAV в assets). Без микрофона, без уведомлений, без запроса разрешений.
final class IronVibeTimerSounds {
  IronVibeTimerSounds._();

  static final AudioPlayer _tickPlayer = AudioPlayer(playerId: '__iv_timer_tick');
  static final AudioPlayer _phasePlayer = AudioPlayer(playerId: '__iv_timer_phase');
  static Future<void>? _initFuture;

  static Future<void> initialize() => _initFuture ??= _doInit();

  /// Короткие сигналы: transient may duck + MediaPlayer, чтобы по [onCompletion] вызывался
  /// [stop] → [FocusManager.handleStop] / abandonAudioFocusRequest на Android.
  static AudioContext get _timerAudioContext => AudioContext(
        android: const AudioContextAndroid(
          contentType: AndroidContentType.sonification,
          usageType: AndroidUsageType.assistanceSonification,
          audioFocus: AndroidAudioFocus.gainTransientMayDuck,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playback,
          options: const {AVAudioSessionOptions.mixWithOthers},
        ),
      );

  /// Статические [AudioPlayer] регистрируются в нативе при загрузке класса с дефолтным
  /// [AndroidAudioFocus.gain] (полный захват). Глобальный [AudioPlayer.global.setAudioContext]
  /// меняет только шаблон для **новых** плееров — у тикера остаётся старый фокус, из‑за чего
  /// после бипа не отрабатывает ожидаемое освобождение и ducking «залипает». Поэтому после
  /// [stop] обязательно [setAudioContext] на каждый экземпляр и явно [PlayerMode.mediaPlayer]
  /// ([PlayerMode.lowLatency] / SoundPool не даёт onCompletion → нет abandon).
  static Future<void> _doInit() async {
    final ctx = _timerAudioContext;
    await AudioPlayer.global.setAudioContext(ctx);
    await _tickPlayer.setReleaseMode(ReleaseMode.stop);
    await _phasePlayer.setReleaseMode(ReleaseMode.stop);
    await _tickPlayer.setPlayerMode(PlayerMode.mediaPlayer);
    await _phasePlayer.setPlayerMode(PlayerMode.mediaPlayer);
    try {
      await _tickPlayer.stop();
    } catch (_) {}
    try {
      await _phasePlayer.stop();
    } catch (_) {}
    await _tickPlayer.setAudioContext(ctx);
    await _phasePlayer.setAudioContext(ctx);
  }

  static void playTick() {
    unawaited(_playTick());
  }

  static Future<void> _playTick() async {
    await initialize();
    try {
      await _tickPlayer.stop();
      await _tickPlayer.play(AssetSource('sounds/timer_tick.wav'), volume: 0.88);
    } catch (e, st) {
      assert(() {
        debugPrint('IronVibeTimerSounds.playTick: $e\n$st');
        return true;
      }());
      try {
        SystemSound.play(SystemSoundType.click);
      } catch (_) {}
    }
  }

  static void playPhase() {
    unawaited(_playPhase());
  }

  static Future<void> _playPhase() async {
    await initialize();
    try {
      await _phasePlayer.stop();
      await _phasePlayer.play(AssetSource('sounds/timer_phase.wav'), volume: 0.92);
    } catch (e, st) {
      assert(() {
        debugPrint('IronVibeTimerSounds.playPhase: $e\n$st');
        return true;
      }());
      try {
        SystemSound.play(SystemSoundType.alert);
      } catch (_) {}
    }
  }
}
