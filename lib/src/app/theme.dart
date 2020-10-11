import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ElevatedButtonThemeData createElevatedButtonTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFF6F61),
        onPrimary: colorScheme.onPrimary,
        onSurface: colorScheme.onSurface,
        shadowColor: theme.shadowColor,
        textStyle: theme.textTheme.button,
        visualDensity: theme.visualDensity,
        tapTargetSize: theme.materialTapTargetSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
    );
  }

  static OutlinedButtonThemeData createOutlinedButtonTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        onSurface: colorScheme.onSurface,
        shadowColor: theme.shadowColor,
        textStyle: theme.textTheme.button,
        visualDensity: theme.visualDensity,
        tapTargetSize: theme.materialTapTargetSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }

  static TextTheme createTextTheme(TextTheme theme) => GoogleFonts.latoTextTheme(theme);

  static ThemeData createDark() {
    final orig = ThemeData.dark();
    final textTheme = createTextTheme(orig.textTheme);
    final base = ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primaryDark,
      primaryColorLight: AppColors.primaryLight,
      accentColor: AppColors.secondary,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: Colors.white,
        surface: AppColors.black,
        secondary: AppColors.primaryVariant,
        secondaryVariant: AppColors.secondaryVariant,
      ),
      disabledColor: AppColors.lightGrey,
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        color: AppColors.black,
        textTheme: textTheme.copyWith(
          headline6: AppThemes.titleTextStyle.copyWith(
            fontSize: 18,
            color: AppColors.primaryVariant,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.primary,
        ),
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme.copyWith(
        headline1: textTheme.headline1.copyWith(color: AppColors.primary),
        headline2: textTheme.headline1.copyWith(color: AppColors.primary),
        headline3: textTheme.headline1.copyWith(color: AppColors.primary),
        headline4: textTheme.headline1.copyWith(color: AppColors.primary),
        headline5: textTheme.headline1.copyWith(color: AppColors.primary),
        headline6: textTheme.headline1.copyWith(color: AppColors.primary),
        subtitle1: textTheme.headline1.copyWith(color: AppColors.primary),
        subtitle2: textTheme.headline1.copyWith(color: AppColors.primary),
        bodyText1: textTheme.headline1.copyWith(color: AppColors.primary),
        bodyText2: textTheme.headline1.copyWith(color: AppColors.primary),
      ),
      accentTextTheme: textTheme.copyWith(
        headline1: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        headline2: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        headline3: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        headline4: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        headline5: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        headline6: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        bodyText1: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        bodyText2: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        subtitle1: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
        subtitle2: textTheme.headline1.copyWith(color: AppColors.primaryVariant),
      ),
    );
    return base.copyWith(
      elevatedButtonTheme: createElevatedButtonTheme(base),
      outlinedButtonTheme: createOutlinedButtonTheme(base),
    );
  }

  static ThemeData createLight() {
    final orig = ThemeData.light();
    final textTheme = createTextTheme(orig.textTheme);
    final base = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primaryDark,
      primaryColorLight: AppColors.primaryLight,
      accentColor: AppColors.secondary,
      shadowColor: AppColors.lightGrey,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: Colors.black,
        surface: Colors.white,
        secondary: AppColors.primary2,
        secondaryVariant: AppColors.secondaryVariant,
      ),
      disabledColor: AppColors.lightGrey,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: AppColors.white,
        textTheme: textTheme.copyWith(
          headline6: AppThemes.titleTextStyle.copyWith(
            fontSize: 18,
            color: AppColors.primary2,
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.primary,
        ),
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme.copyWith(
        headline1: textTheme.headline1.copyWith(color: AppColors.primary),
        headline2: textTheme.headline1.copyWith(color: AppColors.primary),
        headline3: textTheme.headline1.copyWith(color: AppColors.primary),
        headline4: textTheme.headline1.copyWith(color: AppColors.primary),
        headline5: textTheme.headline1.copyWith(color: AppColors.primary),
        headline6: textTheme.headline1.copyWith(color: AppColors.primary),
        subtitle1: textTheme.headline1.copyWith(color: AppColors.primary),
        subtitle2: textTheme.headline1.copyWith(color: AppColors.primary),
        bodyText1: textTheme.headline1.copyWith(color: AppColors.primary),
        bodyText2: textTheme.headline1.copyWith(color: AppColors.primary),
      ),
      accentTextTheme: textTheme.copyWith(
        headline1: textTheme.headline1.copyWith(color: AppColors.primary2),
        headline2: textTheme.headline1.copyWith(color: AppColors.primary2),
        headline3: textTheme.headline1.copyWith(color: AppColors.primary2),
        headline4: textTheme.headline1.copyWith(color: AppColors.primary2),
        headline5: textTheme.headline1.copyWith(color: AppColors.primary2),
        headline6: textTheme.headline1.copyWith(color: AppColors.primary2),
        bodyText1: textTheme.headline1.copyWith(color: AppColors.primary2),
        bodyText2: textTheme.headline1.copyWith(color: AppColors.primary2),
        subtitle1: textTheme.headline1.copyWith(color: AppColors.primary2),
        subtitle2: textTheme.headline1.copyWith(color: AppColors.primary2),
      ),
    );
    return base.copyWith(
      elevatedButtonTheme: createElevatedButtonTheme(base),
      outlinedButtonTheme: createOutlinedButtonTheme(base),
    );
  }

  static ThemeData light = createLight();
  static ThemeData dark = createDark();

  static TextStyle get titleTextStyle {
    return GoogleFonts.barrio(
      fontSize: 48.0,
      letterSpacing: 0.15,
      color: AppColors.primaryVariant,
    );
  }
}

class AppColors {
  static Color primary = Color(0xFFfb7268);
  static Color primaryLight = Color(0xFFffa496);
  static Color primaryDark = Color(0xFFc3413d);
  static Color primary2 = Color(0xFFFF6F61);
  static Color primaryVariant = Color(0xFFF2D6Ae);
  static Color secondary = Color(0xFFF5B895);
  static Color secondaryVariant = Color(0xFFF2D6AE);
  static Color black = Color(0xFF121212);
  static Color lightGrey = Color(0xFFBDBDBD);
  static Color neutralGrey = Color(0xFF757575);
  static Color white = Colors.white;
}
