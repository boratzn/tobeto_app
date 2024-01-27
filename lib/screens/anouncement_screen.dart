import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/homepage/anouncements_card.dart';

class AnouncementScreen extends StatelessWidget {
  const AnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      const AnouncementsCard(
          title: "Yeni Grupların Discord'a Katılımı", date: "23.11.2023"),
      const SizedBox(
        width: 45,
      ),
      const AnouncementsCard(
          title: "Yeni Grupların Discord'a Katılımı", date: "23.11.2023"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Duyuru ve Haberlerim",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
            child: item,
          );
        },
      ),
    );
  }
}
