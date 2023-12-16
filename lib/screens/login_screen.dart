import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/providers/login_screen_provider.dart';
import 'package:tobeto_app/theme/app_theme.dart';

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
    return Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(15),
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
                        child: Image.asset(
                          "assets/images/tobeto-logo.png",
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextField(
                        style: textStyle,
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIconColor: Theme.of(context).colorScheme.primary,
                          prefixIcon: const Icon(Icons.person_pin),
                          label: generalTexts("Kullanıcı Adı",context, 16,),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          bool isHidePassword = ref.watch(loginScreenProvider);
                          return TextField(
                            style: textStyle,
                            controller: passwordController,
                            obscureText: isHidePassword,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              label: generalTexts("Şifre",context, 16,),
                              prefixIconColor: Theme.of(context).colorScheme.primary,
                              suffixIconColor: Theme.of(context).colorScheme.primary,
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
                      MaterialButton(
                        height: 50,
                        color: lightColorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        minWidth: double.infinity,
                        child: const Text("GİRİŞ YAP",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Tinos',
                              fontSize: 18),
                        )
                      ),
                      const Divider(color: Colors.black26),
                      InkWell(
                        child: generalTexts(
                            "Parolamı Unuttum",context, 18,),
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
      );
  }
}
