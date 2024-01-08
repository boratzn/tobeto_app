import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/providers/login_screen_provider.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/screens/main_screen.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

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
                height: 410,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      TextField(
                        style: Theme.of(context).textTheme.titleMedium,
                        controller: usernameController,
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
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          bool isHidePassword = ref.watch(loginScreenProvider);
                          //************************ŞİFRE********************************
                          return TextField(
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
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //************************BUTON ********************************* */
                      Consumer(
                        builder: (context, ref, child) {
                          return MaterialButton(
                            height: 50,
                            color: Theme.of(context).colorScheme.surfaceTint,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainScreen(),
                                  ));
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
                      Divider(color: Theme.of(context).colorScheme.primary),
                      InkWell(
                        child: Text(
                          "Parolamı Unuttum",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
