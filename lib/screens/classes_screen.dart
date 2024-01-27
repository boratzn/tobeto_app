import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/homepage/my_classes_card.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      const MyClassesCard(
        imagePath: ecmelPath,
        title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
        date: "21 Eylül 2023 15:20",
      ),
      const MyClassesCard(
          imagePath: ikImagePath,
          title: "Eğitimlere Nasıl Katılırım?",
          date: "8 Eylül 2023 17:06"),
      const MyClassesCard(
          imagePath: ikImagePath,
          title: "Eğitimlere Nasıl Katılırım?",
          date: "8 Eylül 2023 17:06"),
      const MyClassesCard(
        imagePath: ecmelPath,
        title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
        date: "21 Eylül 2023 15:20",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eğitimlerim",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      body: GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.35),
        itemBuilder: (context, index) {
          var item = list[index];
          return item;
        },
      ),
    );
  }
}
