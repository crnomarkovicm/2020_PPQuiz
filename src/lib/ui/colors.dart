import 'dart:ui';

import 'package:flutter/widgets.dart';

enum QuizColors{
  primary,
  secondary,
  background,
  text,
  splash
}

extension QuizColorsExtended on QuizColors{
  static const colors = {
    QuizColors.primary: Color(0xFF172028),
    QuizColors.secondary: Color(0xFF01938),
    QuizColors.background: Color(0xFF000000),
    QuizColors.text: Color(0xFFFFFFFF),
    QuizColors.splash: Color(0xFF06051E),

  };

Color get color => colors[this];

}
