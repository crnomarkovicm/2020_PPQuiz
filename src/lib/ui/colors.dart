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
    QuizColors.secondary: Color(0xFF051938),
    QuizColors.background: Color(0xFF06051E),
    QuizColors.text: Color(0xFF0000000),
    QuizColors.splash: Color(0xFF324884),

  };

Color get color => colors[this];

}
