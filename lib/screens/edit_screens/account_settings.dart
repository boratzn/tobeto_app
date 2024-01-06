import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/index.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Eski Şifre*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
              decoration: InputDecoration(
                  hintText: "Eski Şifre",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Yeni Şifre*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
              decoration: InputDecoration(
                  hintText: "Yeni Şifre",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Yeni Şifre Tekrar*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
              decoration: InputDecoration(
                  hintText: "Yeni Şifre Tekrar",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            SaveButtonWidget(
              onTap: () {},
              title: "Şifre Değiştir",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            SaveButtonWidget(
              onTap: () {},
              title: "Üyeliği Sonlandır",
              color: const Color(0xFFFC5C46),
            ),
          ],
        ),
      ),
    );
  }
}
