import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF850BEC),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFEFDBFF),
    onPrimaryContainer: Color(0xFF2B0053),
    secondary: Color(0xFF006C4E),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF57FDC3),
    onSecondaryContainer: Color(0xFF002115),
    tertiary: Color(0xFF805159),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD9DE),
    onTertiaryContainer: Color(0xFF321018),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1D1B1E),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1D1B1E),
    surfaceVariant: Color(0xFFE8E0EB),
    onSurfaceVariant: Color(0xFF4A454E),
    outline: Color(0xFF7B757F),
    onInverseSurface: Color(0xFFF5EFF4),
    inverseSurface: Color(0xFF322F33),
    inversePrimary: Color(0xFFDAB9FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF850BEC),
    outlineVariant: Color(0xFFCCC4CF),
    scrim: Color(0xFF000000),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 30),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 28),
    bodySmall: TextStyle(color: Colors.black, fontSize: 22),
    titleLarge:
        TextStyle(color: Colors.white, fontFamily: 'Tinos', fontSize: 18),
    titleMedium:
        TextStyle(color: Color(0xFF1D1B1E), fontFamily: 'Tinos', fontSize: 16),
    labelSmall:
        TextStyle(color: Color(0xFF7B757F), fontFamily: 'Tinos', fontSize: 16),
    labelMedium:
        TextStyle(color: Color(0xFF850BEC), fontFamily: 'Tinos', fontSize: 17),
  ),
  cardTheme: const CardTheme(
    color: Color(0xFFFFFFFF),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.black12,
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFDAB9FF)),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(5),
      backgroundColor: MaterialStatePropertyAll(Color(0xFF850BEC)),
    ),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFDAB9FF),
    onPrimary: Color(0xFF470084),
    primaryContainer: Color(0xFF6500B8),
    onPrimaryContainer: Color(0xFFEFDBFF),
    secondary: Color(0xFF2CE0A8),
    onSecondary: Color(0xFF003827),
    secondaryContainer: Color(0xFF00513A),
    onSecondaryContainer: Color(0xFF57FDC3),
    tertiary: Color(0xFFF2B7BF),
    onTertiary: Color(0xFF4B252C),
    tertiaryContainer: Color(0xFF653B42),
    onTertiaryContainer: Color(0xFFFFD9DE),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1D1B1E),
    onBackground: Color(0xFFE7E1E5),
    surface: Color(0xFF1D1B1E),
    onSurface: Color(0xFFE7E1E5),
    surfaceVariant: Color(0xFF4A454E),
    onSurfaceVariant: Color(0xFFCCC4CF),
    outline: Color(0xFF958E98),
    onInverseSurface: Color(0xFF1D1B1E),
    inverseSurface: Color(0xFFE7E1E5),
    inversePrimary: Color(0xFF850BEC),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFDAB9FF),
    outlineVariant: Color(0xFF4A454E),
    scrim: Color(0xFF000000),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 30),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 28),
    bodySmall: TextStyle(color: Colors.white, fontSize: 22),
    titleLarge:
        TextStyle(color: Colors.white, fontFamily: 'Tinos', fontSize: 18),
    titleMedium:
        TextStyle(color: Color(0xFFE7E1E5), fontFamily: 'Tinos', fontSize: 16),
    labelSmall:
        TextStyle(color: Color(0xFF958E98), fontFamily: 'Tinos', fontSize: 16),
    labelMedium:
        TextStyle(color: Color(0xFFDAB9FF), fontFamily: 'Tinos', fontSize: 17),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF1D1B1E),
    shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.1),
        borderRadius: BorderRadius.circular(15)),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.black26,
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xFFDAB9FF)),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(5),
      backgroundColor: MaterialStatePropertyAll(Color(0xFF850BEC)),
    ),
  ),
);
