import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/providers/login_screen_provider.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/screens/create_account_screen.dart';
import 'package:tobeto_app/screens/main_screen.dart';
import 'package:tobeto_app/screens/reset_password_screen.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     backgroundImagePath,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0),
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey
                  //         .withOpacity(0.5), // Gölge rengi ve opaklığı
                  //     spreadRadius: 5, // Gölge yayılma alanı
                  //     blurRadius: 7, // Gölge bulanıklık yarıçapı
                  //     offset:
                  //         const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                  //   ),
                  // ],
                ),
                //height: 410,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 100,
                          child: Hero(
                            tag: tobetoLogoPath,
                            child: Image.asset(
                              tobetoLogoPath,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        //********************************KULLANICI ADI********************************
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context).textTheme.titleMedium,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIconColor:
                                Theme.of(context).colorScheme.primary,
                            prefixIcon: const Icon(Icons.person_pin),
                            label: generalTexts(
                              "Kullanıcı Kodu",
                              context,
                            ),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Alanlar boş bırakılamaz";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            bool isHidePassword =
                                ref.watch(loginScreenProvider);
                            //************************ŞİFRE********************************
                            return TextFormField(
                              style: Theme.of(context).textTheme.titleMedium,
                              controller: passwordController,
                              obscureText: isHidePassword,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                label: generalTexts(
                                  "Şifre",
                                  context,
                                ),
                                prefixIconColor:
                                    Theme.of(context).colorScheme.primary,
                                suffixIconColor:
                                    Theme.of(context).colorScheme.primary,
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(loginScreenProvider.notifier)
                                          .changeState();
                                    },
                                    icon: isHidePassword
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility)),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              validator: (value) {
                                if (value == "") {
                                  return "Alanlar boş bırakılamaz";
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //************************BUTON ********************************* */
                        Consumer(
                          builder: (context, ref, child) {
                            return MaterialButton(
                              height: 50,
                              color: const Color(0xFF850BEC),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                authService.signInWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text,
                                );
                                authService.auth
                                    .authStateChanges()
                                    .listen((user) {
                                  if (user != null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen(),
                                        ));
                                  }
                                });

                                ref.read(pageIndexProvider.notifier).state = 0;
                              },
                              minWidth: double.infinity,
                              child: Text(
                                "GİRİŞ YAP",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(color: Theme.of(context).colorScheme.primary),
                        InkWell(
                          child: Text(
                            "Şifremi Unuttum",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordScreen(),
                                ));
                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Henüz üye değil misin?",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : Colors.white)),
                            TextButton(
                              child: Text(
                                "Kayıt Ol",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount(),
                                    ));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // customAlertDialog(String error) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("Uyarı"),
  //         content: Text(error),
  //         actions: [
  //           ElevatedButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text("Tamam"))
  //         ],
  //       );
  //     },
  //   );
  // }
}
