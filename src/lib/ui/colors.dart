import 'dart:ui';

import 'package:flutter/widgets.dart';

enum QuizColors{
  primary,
  secondary,
  background,
  text,
  text2,
  button,
  darkText,
  darkText2,
  darkPrimary,
  darkSecondary,
  darkBackground
}

extension QuizColorsExtended on QuizColors{
  static const colors = {
    QuizColors.primary: Color(0xFF2196F3),
    QuizColors.secondary: Color(0xFF1769AA),
    QuizColors.background: Color(0xFFFFFFFF),
    QuizColors.text: Color(0xFFFFFFFF),
    QuizColors.text2: Color(0xFF000000),
    QuizColors.button: Color(0xFF607D8B),
    QuizColors.darkText: Color(0xFF000000),
    QuizColors.darkText2: Color(0xFFFFFFFF),
    QuizColors.darkPrimary: Color(0xFF051938),
    QuizColors.darkSecondary: Color(0xFF172028),
    QuizColors.darkBackground: Color(0xFF06051E)
  };

Color get color => colors[this];

}
