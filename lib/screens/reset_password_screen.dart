import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/screens/index.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/index.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Şifre Sıfırlama",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 15),
              controller: textController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      "Şifre sıfırlama linki için e-posta adresinizi giriniz..."),
            ),
            const SizedBox(
              height: 20,
            ),
            SaveButtonWidget(
              onTap: () {
                context
                    .read<UserDataBloc>()
                    .add(ResetPassword(email: textController.text));
                showToast(
                    message:
                        "Şifre sıfırlama linki mailinize başarıyla gönderildi.");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              title: "Gönder",
            )
          ],
        ),
      ),
    );
  }
}
