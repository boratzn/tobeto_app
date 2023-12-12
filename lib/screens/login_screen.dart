import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/app_theme.dart';

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
          Positioned.fill(
            child: Image.asset(
              "assets/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                          "assets/tobeto-logo.png",
                        ),
                      ),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIconColor: lightColorScheme.primary,
                          prefixIcon: const Icon(Icons.person_pin),
                          hintText: "Kullanıcı Adı",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIconColor: lightColorScheme.primary,
                          suffixIconColor: lightColorScheme.primary,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          hintText: "Şifre",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(15)),
                        ),
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
                        child: const Text(
                          "GİRİŞ YAP",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const Divider(color: Colors.black26),
                      InkWell(
                        child: const Text(
                          "Parolamı Unuttum",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
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
