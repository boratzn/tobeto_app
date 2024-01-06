import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/index.dart';

class SkillsInformation extends StatefulWidget {
  const SkillsInformation({super.key});

  @override
  State<SkillsInformation> createState() => _SkillsInformationState();
}

class _SkillsInformationState extends State<SkillsInformation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Text(
              "Yetkinlik*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "Seçiniz",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            SaveButtonWidget(
              onTap: () {},
            ),
            //Buraya yetkinlikler gelecek
          ],
        ),
      ),
    );
  }
}
