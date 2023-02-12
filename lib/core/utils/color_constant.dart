import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color black90033 = fromHex('#33000000');

  static Color blue700 = fromHex('#2e8bc0');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color blue100 = fromHex('#c2e2f5');

  static Color indigo900 = fromHex('#001a72');

  static Color whiteA700 = fromHex('#ffffff');

  static Color redA700 = fromHex('#ff0000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
