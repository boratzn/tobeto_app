import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/index.dart';

class EducationInformation extends StatefulWidget {
  const EducationInformation({super.key});

  @override
  State<EducationInformation> createState() => _EducationInformationState();
}

class _EducationInformationState extends State<EducationInformation> {
  String _selectedItem = 'Lisans';
  bool checkBoxState = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Eğitim Durumu*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            DropdownButton<String>(
              isExpanded: true,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
              items: grades.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Üniversite*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  hintText: "Kampüs 365",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Bölüm*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "Yazılım",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Başlangıç Yılı*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "gg.aa.yyyy",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Mezuniyet Yılı*",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  hintText: "gg.aa.yyyy",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: checkBoxState,
                  onChanged: (value) {
                    setState(() {
                      checkBoxState = !checkBoxState;
                    });
                  },
                ),
                Text(
                  "Devam Ediyorum",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            SaveButtonWidget(
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
          ],
        ),
      ),
    );
  }
}
