// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

/// Генерирует минимальные WAV (PCM 16-bit mono) для таймера. Запуск: `dart run tool/generate_timer_sounds.dart`
void main() {
  final dir = Directory('assets/sounds');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }
  writeMonoSineWav(
    File('assets/sounds/timer_tick.wav'),
    sampleRate: 22050,
    durationMs: 68,
    freqHz: 900,
    volume: 0.26,
  );
  writePhaseWav(File('assets/sounds/timer_phase.wav'), sampleRate: 22050);
  stdout.writeln('Generated assets/sounds/timer_tick.wav, timer_phase.wav');
}

void writeMonoSineWav(
  File out, {
  required int sampleRate,
  required int durationMs,
  required double freqHz,
  required double volume,
}) {
  final n = (sampleRate * durationMs / 1000).round();
  final pcm = Int16List(n);
  for (var i = 0; i < n; i++) {
    final envelope = _envelope01(i, n);
    final s = (32767 * volume * envelope * math.sin(2 * math.pi * freqHz * i / sampleRate)).round();
    pcm[i] = s.clamp(-32768, 32767);
  }
  out.writeAsBytesSync(_pcm16MonoWav(pcm, sampleRate), flush: true);
}

void writePhaseWav(File out, {required int sampleRate}) {
  final parts = <Int16List>[
    _sineBurst(sampleRate, ms: 52, freqHz: 740, volume: 0.3),
    Int16List((sampleRate * 28 / 1000).round()),
    _sineBurst(sampleRate, ms: 55, freqHz: 620, volume: 0.32),
  ];
  var total = 0;
  for (final p in parts) {
    total += p.length;
  }
  final pcm = Int16List(total);
  var o = 0;
  for (final p in parts) {
    pcm.setRange(o, o + p.length, p);
    o += p.length;
  }
  out.writeAsBytesSync(_pcm16MonoWav(pcm, sampleRate), flush: true);
}

Int16List _sineBurst(int sampleRate, {required int ms, required double freqHz, required double volume}) {
  final n = (sampleRate * ms / 1000).round();
  final pcm = Int16List(n);
  for (var i = 0; i < n; i++) {
    final envelope = _envelope01(i, n);
    final s = (32767 * volume * envelope * math.sin(2 * math.pi * freqHz * i / sampleRate)).round();
    pcm[i] = s.clamp(-32768, 32767);
  }
  return pcm;
}

double _envelope01(int i, int n) {
  const edge = 20;
  if (n <= edge * 2) return 1;
  if (i < edge) return i / edge;
  if (i > n - edge) return (n - i) / edge;
  return 1;
}

Uint8List _pcm16MonoWav(Int16List samples, int sampleRate) {
  final dataSize = samples.length * 2;
  final riffPayload = 36 + dataSize;
  final b = BytesBuilder(copy: false);
  b.add('RIFF'.codeUnits);
  b.add(_le32(riffPayload));
  b.add('WAVE'.codeUnits);
  b.add('fmt '.codeUnits);
  b.add(_le32(16));
  b.add(_le16(1));
  b.add(_le16(1));
  b.add(_le32(sampleRate));
  b.add(_le32(sampleRate * 2));
  b.add(_le16(2));
  b.add(_le16(16));
  b.add('data'.codeUnits);
  b.add(_le32(dataSize));
  for (var i = 0; i < samples.length; i++) {
    b.add(_le16(samples[i]));
  }
  return b.toBytes();
}

List<int> _le32(int v) => <int>[v & 0xff, (v >> 8) & 0xff, (v >> 16) & 0xff, (v >> 24) & 0xff];
List<int> _le16(int v) => <int>[v & 0xff, (v >> 8) & 0xff];
