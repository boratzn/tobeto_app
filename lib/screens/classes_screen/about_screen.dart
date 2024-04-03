import 'package:flutter/material.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/utils/utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.training});

  final Training training;

  @override
  Widget build(BuildContext context) {
    var totalTime = 0;
    for (var element in training.contents!) {
      totalTime += element.time!;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: getPrimaryColor(context),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Başlangıç ",
                          style: getCommonStyle(context).copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Bitiş ",
                          style: getCommonStyle(context).copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getDateStringFormat(training.startDate),
                          style: getCommonStyle(context).copyWith(fontSize: 18),
                        ),
                        Text(
                          getDateStringFormat(training.endDate),
                          style: getCommonStyle(context).copyWith(fontSize: 18),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.school,
                  color: getPrimaryColor(context),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Eğitim Türü",
                  style: getCommonStyle(context)
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  training.type!,
                  style: getCommonStyle(context).copyWith(fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.category,
                  color: getPrimaryColor(context),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Kategori",
                  style: getCommonStyle(context)
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  training.category!,
                  style: getCommonStyle(context).copyWith(fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.business_center_outlined,
                  color: getPrimaryColor(context),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Üretici Firma",
                  style: getCommonStyle(context)
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  training.manufacturer!,
                  style: getCommonStyle(context).copyWith(fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: getPrimaryColor(context),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Tahmini Süre",
                  style: getCommonStyle(context)
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  totalTime > 3600
                      ? "${convertToMinute(totalTime).$1} sa ${convertToMinute(totalTime).$2} dk"
                      : "${convertToMinute(totalTime).$1} dk ${convertToMinute(totalTime).$2} sn",
                  style: getCommonStyle(context).copyWith(fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
