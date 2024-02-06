import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/screens/screen_index.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';
import 'package:tobeto_app/utils/utils.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var authService = FirebaseAuthService();
  var nameController = TextEditingController();
  var surNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var password2Controller = TextEditingController();
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 9,
                    child: Hero(
                      tag: tobetoLogoPath,
                      child: Image.asset(
                        tobetoLogoPath,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  //********************************AD********************************
                  TextFormField(
                    controller: nameController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 14),
                      label: generalTexts(
                        "Ad*",
                        context,
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Zorunlu alanlar boş bırakılamaz";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //************************SOYAD********************************
                  TextFormField(
                    controller: surNameController,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 14),
                      label: generalTexts(
                        "Soyad*",
                        context,
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Zorunlu alanlar boş bırakılamaz";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //************************E-POSTA********************************
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 14),
                      label: generalTexts(
                        "E-Posta*",
                        context,
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Zorunlu alanlar boş bırakılamaz";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //************************ŞİFRE********************************
                  TextFormField(
                    controller: passwordController,
                    style: Theme.of(context).textTheme.titleMedium,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 14),
                      label: generalTexts(
                        "Şifre*",
                        context,
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Zorunlu alanlar boş bırakılamaz";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //************************ŞİFRE TEKRAR********************************
                  TextFormField(
                    controller: password2Controller,
                    style: Theme.of(context).textTheme.titleMedium,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 14),
                      label: generalTexts(
                        "Şifre Tekrar*",
                        context,
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Zorunlu alanlar boş bırakılamaz";
                      }
                      if (value != password) {
                        return "Şifreler eşleşmiyor";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //************************BUTON ********************************* */
                  MaterialButton(
                    height: 50,
                    color: const Color(0xFF850BEC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          var userCredantial =
                              await authService.signUpWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text);
                          if (userCredantial != null) {
                            authService.saveUserData(
                                userCredantial.uid,
                                nameController.text,
                                surNameController.text,
                                emailController.text);
                            authService.auth
                                .authStateChanges()
                                .listen((User? user) {
                              if (user == null) {
                                // Kullanıcı oturum açmamışsa, giriş sayfasına yönlendirme yapabilirsiniz.
                              } else {
                                // Kullanıcı oturum açmışsa, ana sayfaya yönlendirme yapabilirsiniz.
                                showCustomSnackBar(context);
                                clearTextForms();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                              }
                            });
                          }
                        } on FirebaseAuthException catch (e) {
                          debugPrint(e.message);
                        }
                      }
                    },
                    minWidth: double.infinity,
                    child: Text(
                      "Kayıt Ol",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Zaten bir hesabın var mı?",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white),
                      ),
                      TextButton(
                        child: Text(
                          "Giriş Yap",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
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
    );
  }

  void clearTextForms() {
    nameController.clear();
    surNameController.clear();
    emailController.clear();
    passwordController.clear();
    password2Controller.clear();
  }

  void showCustomSnackBar(BuildContext context) {
    final materialBanner = MaterialBanner(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: 'Tebrikler!!',
        message: 'Kayıt işleminiz başarıyla gerçekleşmiştir!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
        // to configure for material banner
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }
}
