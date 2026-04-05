// ignore_for_file: avoid_print
// Run from Flutter root: dart run tool/gen_store_assets.dart
// Generates Google Play assets: icon_512x512.png, feature_graphic_1024x500.png

import 'dart:io';
import 'package:image/image.dart' as img;

const darkR = 18, darkG = 18, darkB = 18; // #121212

void main() async {
  final assetsDir = Directory('assets');
  if (!await assetsDir.exists()) {
    print('ERROR: assets/ folder not found. Run from Flutter project root.');
    exit(1);
  }
  final logoFile = File('assets/logo_final.png');
  if (!await logoFile.exists()) {
    print('ERROR: assets/logo_final.png not found.');
    exit(1);
  }

  final bytes = await logoFile.readAsBytes();
  final logo = img.decodeImage(bytes);
  if (logo == null) {
    print('ERROR: Could not decode logo_final.png');
    exit(1);
  }

  // 1) Icon 512x512
  const sizeIcon = 512;
  final paddingIcon = (sizeIcon * 0.12).round();
  final boxIcon = sizeIcon - 2 * paddingIcon;
  final logoResized = img.copyResize(logo, width: boxIcon, height: boxIcon);
  final iconImg = img.Image(width: sizeIcon, height: sizeIcon);
  img.fill(iconImg, color: img.ColorRgb8(darkR, darkG, darkB));
  img.compositeImage(iconImg, logoResized, center: true);
  final outIcon = File('assets/icon_512x512.png');
  await outIcon.writeAsBytes(img.encodePng(iconImg));
  print('Saved: ${outIcon.path}');

  // 2) Feature Graphic 1024x500 — canvas 1024x500, black background, logo centered, proportions preserved
  const wFg = 1024, hFg = 500;
  final maxLogoW = (wFg * 0.6).round();
  final maxLogoH = (hFg * 0.7).round();
  // One dimension so copyResize keeps aspect ratio (no stretching)
  final scaleW = maxLogoW / logo.width;
  final scaleH = maxLogoH / logo.height;
  final scale = (scaleW < scaleH ? scaleW : scaleH).clamp(0.0, 10.0);
  final logoW = (logo.width * scale).round();
  final logoFg = img.copyResize(logo, width: logoW); // height follows automatically
  final fgImg = img.Image(width: wFg, height: hFg);
  img.fill(fgImg, color: img.ColorRgb8(0, 0, 0)); // solid black
  img.compositeImage(fgImg, logoFg, center: true);
  final outFg = File('assets/feature_graphic_1024x500.png');
  await outFg.writeAsBytes(img.encodePng(fgImg));
  print('Saved: ${outFg.path}');
}
