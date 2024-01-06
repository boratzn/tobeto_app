import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/edit_screen/save_button_widget.dart';

class LanguageInformation extends StatefulWidget {
  const LanguageInformation({super.key});

  @override
  State<LanguageInformation> createState() => _LanguageInformationState();
}

class _LanguageInformationState extends State<LanguageInformation> {
  String _selectedItem = 'Dil Seçiniz*';
  String _selectedItemLevel = 'Seviye Seçiniz*';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            DropdownButton<String>(
              menuMaxHeight: MediaQuery.of(context).size.height / 2,
              isExpanded: true,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              menuMaxHeight: MediaQuery.of(context).size.height / 2,
              isExpanded: true,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              value: _selectedItemLevel,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItemLevel = newValue!;
                });
              },
              items: levels.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            SaveButtonWidget(
              onTap: () {},
            ),
            //Buraya diller gelecek
          ],
        ),
      ),
    );
  }
}
