// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/screens/screen_index.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var newPassAgainController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 15,
              ),
              Text(
                "Eski Şifre*",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: oldPasswordController,
                keyboardType: TextInputType.visiblePassword,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 17),
                decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    hintText: "Eski Şifre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) return "Alanları boş bırakmayınız";
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 15,
              ),
              Text(
                "Yeni Şifre*",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: newPasswordController,
                keyboardType: TextInputType.visiblePassword,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 17),
                decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    hintText: "Yeni Şifre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) return "Alanları boş bırakmayınız";
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 15,
              ),
              Text(
                "Yeni Şifre Tekrar*",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: newPassAgainController,
                keyboardType: TextInputType.visiblePassword,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 17),
                decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 14),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    hintText: "Yeni Şifre Tekrar",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Alanları boş bırakmayınız";
                  } else if (newPasswordController.text !=
                      newPassAgainController.text) {
                    return "Şifreler eşleşmiyor";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              SaveButtonWidget(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<UserDataBloc>().add(ChangePassword(
                        oldPassword: oldPasswordController.text,
                        newPassword: newPasswordController.text));
                    clearTextFields();
                  }
                },
                title: "Şifre Değiştir",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              SaveButtonWidget(
                onTap: () async {
                  ArtDialogResponse response = await ArtSweetAlert.show(
                      barrierDismissible: false,
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        denyButtonText: "İptal",
                        title: "Hesabı silmek istediğinize emin misiniz?",
                        text: "Bu işlemi yaptıktan sonra geri alamazsınız!",
                        confirmButtonText: "Evet, sil",
                        type: ArtSweetAlertType.warning,
                        onConfirm: () async {
                          context.read<UserDataBloc>().add(DeleteUser());
                          Navigator.pop(context);
                        },
                      ));

                  if (response.isTapConfirmButton) {
                    // ignore: use_build_context_synchronously
                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.success,
                            title: "Hesap başaryıla silindi!"));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  }
                },
                title: "Üyeliği Sonlandır",
                color: const Color(0xFFFC5C46),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearTextFields() {
    oldPasswordController.clear();
    newPasswordController.clear();
    newPassAgainController.clear();
  }
}
