import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/firebase_options.dart';
import 'package:tobeto_app/screens/index.dart';
import 'package:tobeto_app/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserDataBloc(FirebaseAuthService()),
      ),
    ],
    child: const ProviderScope(child: MainApp()),
  ));
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
            nextScreen: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const MainScreen();
                }
                return const LoginScreen();
              },
            ),
            splashScreenBody: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Lottie.asset(
                  'assets/animations/splash_animation.json',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
