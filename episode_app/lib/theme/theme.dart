// ignore_for_file: use_full_hex_values_for_flutter_colors

import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 255, 255, 255),
      surfaceTint: Color(4278217073),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288540921),
      onPrimaryContainer: Color(4278198306),
      secondary: Color(4283065189),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291618795),
      onSecondaryContainer: Color(4278525730),
      tertiary: Color(4283457149),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292403967),
      onTertiaryContainer: Color(4278917942),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color.fromARGB(255, 159, 191, 197),
      onSurface: Color(4279639325),
      onSurfaceVariant: Color(4282337353),
      outline: Color(4285495674),
      outlineVariant: Color(4290693321),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020978),
      inversePrimary: Color(4286698716),
      primaryFixed: Color(4288540921),
      onPrimaryFixed: Color(4278198306),
      primaryFixedDim: Color(4286698716),
      onPrimaryFixedVariant: Color(4278210389),
      secondaryFixed: Color(4291618795),
      onSecondaryFixed: Color(4278525730),
      secondaryFixedDim: Color(4289842126),
      onSecondaryFixedVariant: Color(4281486158),
      tertiaryFixed: Color(4292403967),
      onTertiaryFixed: Color(4278917942),
      tertiaryFixedDim: Color(4290299626),
      onTertiaryFixedVariant: Color(4281878372),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916149),
      surfaceContainer: Color(4293521391),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797668),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209360),
      surfaceTint: Color(4278217073),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280516744),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281222986),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284512636),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281615200),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284904852),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4279639325),
      onSurfaceVariant: Color(4282074438),
      outline: Color(4283916642),
      outlineVariant: Color(4285758590),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020978),
      inversePrimary: Color(4286698716),
      primaryFixed: Color(4280516744),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216302),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284512636),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282867811),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284904852),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283260027),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916149),
      surfaceContainer: Color(4293521391),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797668),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200106),
      surfaceTint: Color(4278217073),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209360),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278986280),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281222986),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279378493),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281615200),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310651),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280034599),
      outline: Color(4282074438),
      outlineVariant: Color(4282074438),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020978),
      inversePrimary: Color(4290050303),
      primaryFixed: Color(4278209360),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202935),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281222986),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279775283),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281615200),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280167496),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916149),
      surfaceContainer: Color(4293521391),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797668),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 16, 23, 23),
      surfaceTint: Color(4286698716),
      onPrimary: Color.fromARGB(255, 0, 12, 13),
      primaryContainer: Color(4278210389),
      onPrimaryContainer: Color(4288540921),
      secondary: Color(4289842126),
      onSecondary: Color(4280038455),
      secondaryContainer: Color(4281486158),
      onSecondaryContainer: Color(4291618795),
      tertiary: Color(4290299626),
      onTertiary: Color(4280365132),
      tertiaryContainer: Color(4281878372),
      onTertiaryContainer: Color(4292403967),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color.fromARGB(255, 0, 32, 32),
      onSurface: Color(4292797668),
      onSurfaceVariant: Color(4290693321),
      outline: Color(4287206036),
      outlineVariant: Color(4282337353),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797668),
      inversePrimary: Color(4278217073),
      primaryFixed: Color(4288540921),
      onPrimaryFixed: Color(4278198306),
      primaryFixedDim: Color(4286698716),
      onPrimaryFixedVariant: Color(4278210389),
      secondaryFixed: Color(4291618795),
      onSecondaryFixed: Color(4278525730),
      secondaryFixedDim: Color(4289842126),
      onSecondaryFixedVariant: Color(4281486158),
      tertiaryFixed: Color(4292403967),
      onTertiaryFixed: Color(4278917942),
      tertiaryFixedDim: Color(4290299626),
      onTertiaryFixedVariant: Color(4281878372),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279639325),
      surfaceContainer: Color(4279902497),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286961889),
      surfaceTint: Color(4286698716),
      onPrimary: Color(4278196764),
      primaryContainer: Color(4282883493),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290105555),
      onSecondary: Color(4278196764),
      secondaryContainer: Color(4286354840),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290563054),
      onTertiary: Color(4278523441),
      tertiaryContainer: Color(4286747058),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294376700),
      onSurfaceVariant: Color(4291022286),
      outline: Color(4288390566),
      outlineVariant: Color(4286285190),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797668),
      inversePrimary: Color(4278210646),
      primaryFixed: Color(4288540921),
      onPrimaryFixed: Color(4278195222),
      primaryFixedDim: Color(4286698716),
      onPrimaryFixedVariant: Color(4278205762),
      secondaryFixed: Color(4291618795),
      onSecondaryFixed: Color(4278195222),
      secondaryFixedDim: Color(4289842126),
      onSecondaryFixedVariant: Color(4280367677),
      tertiaryFixed: Color(4292403967),
      onTertiaryFixed: Color(4278259755),
      tertiaryFixedDim: Color(4290299626),
      onTertiaryFixedVariant: Color(4280759890),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279639325),
      surfaceContainer: Color(4279902497),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293918207),
      surfaceTint: Color(4286698716),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4286961889),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293918207),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290105555),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294703871),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290563054),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294180350),
      outline: Color(4291022286),
      outlineVariant: Color(4291022286),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797668),
      inversePrimary: Color(4278202163),
      primaryFixed: Color(4288804093),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4286961889),
      onPrimaryFixedVariant: Color(4278196764),
      secondaryFixed: Color(4291947759),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290105555),
      onSecondaryFixedVariant: Color(4278196764),
      tertiaryFixed: Color(4292798463),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290563054),
      onTertiaryFixedVariant: Color(4278523441),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279639325),
      surfaceContainer: Color(4279902497),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
