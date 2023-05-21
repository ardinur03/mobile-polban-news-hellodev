import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7004c = fromHex('#4cffffff');

  static Color black9004c = fromHex('#4c000000');

  static Color blue700 = fromHex('#2e8bc0');

  static Color indigoA200 = fromHex('#4b7bf5');

  static Color black900 = fromHex('#000000');

  static Color indigo900Bf = fromHex('#bf001a72');

  static Color bluegray400 = fromHex('#888888');

  static Color lightBlueA700 = fromHex('#0080ff');

  static Color indigo900 = fromHex('#001a72');

  static Color blue200 = fromHex('#9fc9f3');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color redA700 = fromHex('#ff0000');

  static Color gray100 = fromHex('#f6f6f6');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray400 = fromHex('#888888');

  static Color gray900 = fromHex('#151619');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
