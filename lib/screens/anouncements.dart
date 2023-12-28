import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/index.dart';

class Anouncements extends StatelessWidget {
  const Anouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          AnouncementsCard(
              title: "Yeni Grupların Discord'a Katılımı", date: "23.11.2023"),
          SizedBox(
            width: 45,
          ),
          AnouncementsCard(
              title: "Yeni Grupların Discord'a Katılımı", date: "23.11.2023")
        ],
      ),
    );
  }
}
