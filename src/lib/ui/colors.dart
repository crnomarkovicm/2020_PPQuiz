import 'dart:ui';

import 'package:flutter/widgets.dart';

enum QuizColors{
  primary,
  secondary,
  background,
  text,
  darkPrimary,
  darkSecondary,
  darkBackground
}

extension QuizColorsExtended on QuizColors{
  static const colors = {
    QuizColors.primary: Color(0xFF2196F3),
    QuizColors.secondary: Color(0xFF2196F3),
    QuizColors.background: Color(0xFFFFFFFF),
    QuizColors.text: Color(0xFFFFFFFF),
    QuizColors.darkPrimary: Color(0xFF051938),
    QuizColors.darkSecondary: Color(0xFF172028),
    QuizColors.darkBackground: Color(0xFF06051E)
  };

Color get color => colors[this];

}
