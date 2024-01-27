import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/profile_screen/exams_widget.dart';

class ExamsSection extends StatelessWidget {
  const ExamsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tobeto Seviye Testlerim",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              //width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ExamsWidget(
                    title: "Microsoft SQL Server",
                    date: "06-09-2023",
                    score: "76.00",
                  ),
                  ExamsWidget(
                    title: "Herkes İçin Kodlama 1B Değerlendirme Sınavı",
                    date: "11-11-2023",
                    score: "76.00",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
