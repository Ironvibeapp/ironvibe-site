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

  static Future<void> _doInit() async {
    await AudioPlayer.global.setAudioContext(
      AudioContext(
        android: const AudioContextAndroid(
          contentType: AndroidContentType.sonification,
          usageType: AndroidUsageType.assistanceSonification,
          audioFocus: AndroidAudioFocus.gainTransientMayDuck,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playback,
          options: const {AVAudioSessionOptions.mixWithOthers},
        ),
      ),
    );
    await _tickPlayer.setReleaseMode(ReleaseMode.release);
    await _phasePlayer.setReleaseMode(ReleaseMode.release);
    await _tickPlayer.setPlayerMode(PlayerMode.lowLatency);
    await _phasePlayer.setPlayerMode(PlayerMode.lowLatency);
  }

  static void playTick() {
    unawaited(_playTick());
  }

  static Future<void> _playTick() async {
    await initialize();
    try {
      await _tickPlayer.stop();
      await _tickPlayer.play(AssetSource('sounds/timer_tick.wav'), mode: PlayerMode.lowLatency, volume: 0.88);
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
      await _phasePlayer.play(AssetSource('sounds/timer_phase.wav'), mode: PlayerMode.lowLatency, volume: 0.92);
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
