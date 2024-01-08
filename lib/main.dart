import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/screens/login_screen.dart';
import 'package:tobeto_app/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: FlutterSplashScreen(
            backgroundColor: Colors.white,
            duration: const Duration(seconds: 4),
            nextScreen: const LoginScreen(),
            splashScreenBody: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Lottie.asset('assets/animations/splash_animation.json',
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
