import 'package:flutter/material.dart';

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
          Image.asset(
            "assets/login_background.jpg",
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 90,
                        child: Image.asset(
                          "assets/tobeto_logo.jpeg",
                          width: double.infinity,
                        ),
                      ),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIconColor: Colors.purple,
                          prefixIcon: const Icon(Icons.person_pin),
                          hintText: "Kullanıcı Adı",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          prefixIconColor: Colors.purple,
                          suffixIconColor: Colors.purple,
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
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        minWidth: double.infinity,
                        child: const Text(
                          "GİRİŞ YAP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(color: Colors.black26),
                      InkWell(
                        child: const Text(
                          "Parolamı Unuttum",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onTap: () {},
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
