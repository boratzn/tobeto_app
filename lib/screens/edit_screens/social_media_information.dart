import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/edit_screen/save_button_widget.dart';

class SocialMediaInformation extends StatefulWidget {
  const SocialMediaInformation({super.key});

  @override
  State<SocialMediaInformation> createState() => _SocialMediaInformationState();
}

class _SocialMediaInformationState extends State<SocialMediaInformation> {
  String _selectedItem = 'Seçiniz*';
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
              items: sMediaList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
              decoration: InputDecoration(
                  hintText: "https://",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            SaveButtonWidget(
              onTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Github",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 17),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.67,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SingleChildScrollView(
                                  child: Text(
                                    "https://github.com/boratzn",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFC6D6D),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(trashImagePath),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFC6D6D),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              editImagePath,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
