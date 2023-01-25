import 'package:flutter/material.dart';
import 'package:juiceflutterpoc/design/color_extension.dart';

/// According to Zühlke CICD specification: https://zuhlke.sharepoint.com/sites/country/ch/com/SitePages/Logo%20und%20Corporate%20Identity.aspx
enum ZuehlkeColors {
  /// Primary
  orange(0xFFFF9900),
  darkGray(0xFF666666),
  lightGray(0xFFCCCCCC),
  purple(0xFF985B9C),
  brightBlue(0xFF66CCFF),
  blue(0xFF0099CC),
  brightGreen(0xFFCCFF00),
  green(0xFF00CC66),
  textBlack(0xFF505050),
  textWhite(0xFFFFFFFF),
  backgroundWhite(0xFFFFFFFF);

  const ZuehlkeColors(this.rgb);

  final int rgb;

  Color get color => Color(rgb);

  Color get at25PercentShade => color.lighten(amount: 0.75);

  Color get at50PercentShade => color.lighten(amount: 0.5);

  Color get at75PercentShade => color.lighten(amount: 0.25);
}

/// letter spacing has to be adjusted according to the CICD specification
const _letterSpacing = 0.1;

final zuehlkeTheme = ThemeData.from(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: ZuehlkeColors.orange.color,
    onPrimary: ZuehlkeColors.textWhite.color,
    secondary: ZuehlkeColors.purple.color,
    onSecondary: ZuehlkeColors.textWhite.color,
    error: Colors.red[700]!,
    onError: ZuehlkeColors.textWhite.color,
    background: ZuehlkeColors.backgroundWhite.color,
    onBackground: ZuehlkeColors.textBlack.color,
    surface: ZuehlkeColors.lightGray.color,
    onSurface: ZuehlkeColors.textBlack.color,
  ),
  textTheme: ThemeData.light()
      .textTheme
      .apply(
        fontFamily: 'Zuehlke',
        displayColor: ZuehlkeColors.textBlack.color,
        bodyColor: ZuehlkeColors.textBlack.color,
      )
      .merge(
        const TextTheme(
          displayLarge: TextStyle(letterSpacing: _letterSpacing),
          displayMedium: TextStyle(letterSpacing: _letterSpacing),
          displaySmall: TextStyle(letterSpacing: _letterSpacing),
          headlineLarge: TextStyle(letterSpacing: _letterSpacing),
          headlineMedium: TextStyle(letterSpacing: _letterSpacing),
          headlineSmall: TextStyle(letterSpacing: _letterSpacing),
          titleLarge: TextStyle(letterSpacing: _letterSpacing),
          titleMedium: TextStyle(letterSpacing: _letterSpacing),
          titleSmall: TextStyle(letterSpacing: _letterSpacing),
          bodyLarge: TextStyle(letterSpacing: _letterSpacing),
          bodyMedium: TextStyle(letterSpacing: _letterSpacing),
          bodySmall: TextStyle(letterSpacing: _letterSpacing),
          labelLarge: TextStyle(letterSpacing: _letterSpacing),
          labelMedium: TextStyle(letterSpacing: _letterSpacing),
          labelSmall: TextStyle(letterSpacing: _letterSpacing),
        ),
      ),
);
