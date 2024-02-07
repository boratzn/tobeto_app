import 'package:flutter/material.dart';
import 'package:tobeto_app/models/education.dart';
import 'package:tobeto_app/utils/utils.dart';

class EducationListCard extends StatelessWidget {
  const EducationListCard({
    super.key,
    required this.item,
  });

  final Education item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Color(0xFFC579FF),
                    ),
                    Text(
                      "${getDateStringFormat(item.startDate)} - ${getDateStringFormat(item.endDate)}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? const Color(0xFFC579FF)
                              : const Color(0xFF822BD9)),
                    ),
                  ],
                ),
                Text(item.educationState ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 13, color: const Color(0xFF822BD9)))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Üniversite",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.grey[700]
                                        : Colors.grey[400]),
                          ),
                          Text(item.university ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bölüm",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.grey[700]
                                        : Colors.grey[400]),
                          ),
                          Text(item.department ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18))
                        ],
                      )
                    ],
                  )),
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.delete),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
