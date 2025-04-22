// ignore_for_file: file_names

import 'dart:ui';

Color hexaToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0x66000000);
}
