import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/calender_screen/class_card.dart';
import 'package:tobeto_app/widgets/calender_screen/class_state_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var textController = TextEditingController();
  OptionItem optionItemSelected = OptionItem(title: "Eğitmen Dojo");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eğitim Arama",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  controller: textController,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(),
                    hintText: "Eğitim arayın...",
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Eğitmen",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              SelectDropList(
                itemSelected: optionItemSelected,
                dropListModel: teachers,
                showIcon: true,
                showArrowIcon: true,
                showBorder: true,
                paddingTop: 0,
                paddingLeft: 0,
                paddingRight: 0,
                paddingBottom: 0,
                paddingDropItem: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 10, right: 20),
                suffixIcon: Icons.arrow_drop_down,
                containerPadding: const EdgeInsets.all(10),
                icon: const Icon(Icons.school, color: Colors.black),
                onOptionSelected: (optionItem) {
                  optionItemSelected = optionItem;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Eğitim Durumu",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              const ClassStateWidget(
                  color: Color(0xFFFF442B), title: "Bitmiş Dersler"),
              const ClassStateWidget(
                  color: Color(0xFFFAC059), title: "Devam Eden Dersler"),
              const ClassStateWidget(
                  color: Color(0xFF5FBF9F), title: "Satın Alınmış Dersler"),
              const ClassStateWidget(
                  color: Color(0xFF5C6CC1), title: "Satın Alınmış Dersler"),
              const Divider(),
              const SizedBox(
                height: 25,
              ),
              const ClassCard(
                  title: "C# Programming",
                  instructor: "Gürkan İlişen",
                  color: Color(0xFFFFC7BF),
                  borderColer: Colors.red,
                  startDate: "15 Ara 2022 18:00",
                  endDate: "15 Ara 2022 20:00"),
              const SizedBox(
                height: 5,
              ),
              const ClassCard(
                  title: "C# Programming",
                  instructor: "Gürkan İlişen",
                  color: Color(0xFFFFC7BF),
                  borderColer: Colors.red,
                  startDate: "15 Ara 2022 18:00",
                  endDate: "15 Ara 2022 20:00"),
              const SizedBox(
                height: 5,
              ),
              const ClassCard(
                  title: "C# Programming",
                  instructor: "Gürkan İlişen",
                  color: Color(0xFFFFC7BF),
                  borderColer: Colors.red,
                  startDate: "15 Ara 2022 18:00",
                  endDate: "15 Ara 2022 20:00"),
              const SizedBox(
                height: 5,
              ),
              const ClassCard(
                title: "Herkes İçin Kodlama - 1B",
                instructor: "Gürkan İlişen",
                color: Color(0xFFCFECE2),
                borderColer: Colors.green,
                startDate: "15 Ara 2022 18:00",
              )
            ],
          ),
        ),
      ),
    );
  }
}
