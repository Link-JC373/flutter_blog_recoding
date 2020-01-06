import 'package:flutter/cupertino.dart';

class LoginTheme {
  // static const Color loginGradientStart = const Color(0x0000CD);
  // static const Color loginGradientEnd = const Color(0x9932CC);
  static const Color loginGradientStart = const Color(0xFFfbab66);
  static const Color loginGradientEnd = const Color(0xFFf7418c);

  static const LinearGradient primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
