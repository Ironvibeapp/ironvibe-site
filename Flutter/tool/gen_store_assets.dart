// ignore_for_file: avoid_print
// Prefer: from Flutter root, `node tool/rasterize_logo.mjs`
// (builds icon + feature graphic from assets/logo_on_dark.svg).
//
// This Dart helper only copies an already-tight 512 icon — it does not add
// padding. logo_final.png is the finished launcher source.

import 'dart:io';

void main() async {
  final logoFile = File('assets/logo_final.png');
  if (!await logoFile.exists()) {
    print('ERROR: assets/logo_final.png not found.');
    print('Generate it first: node tool/rasterize_logo.mjs');
    exit(1);
  }

  final bytes = await logoFile.readAsBytes();
  await File('assets/icon_512x512.png').writeAsBytes(bytes);
  await File('assets/app_icon.png').writeAsBytes(bytes);
  print('Copied logo_final.png → icon_512x512.png, app_icon.png');
  print('For a full SVG rebuild (including feature graphic): node tool/rasterize_logo.mjs');
}
