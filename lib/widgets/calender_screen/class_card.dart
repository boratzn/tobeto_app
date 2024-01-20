import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class ClassCard extends StatelessWidget {
  const ClassCard(
      {super.key,
      required this.title,
      required this.instructor,
      required this.color,
      required this.startDate,
      this.endDate,
      required this.borderColer});

  final String title;
  final String instructor;
  final Color color;
  final Color borderColer;
  final String startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: Border.all(
          color: borderColer,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      timeStartImagePath,
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      startDate,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    )
                  ],
                ),
                Row(
                  children: [
                    endDate != null
                        ? Image.asset(
                            timeEndImagePath,
                            height: 20,
                            width: 20,
                          )
                        : const Text(""),
                    Text(
                      endDate ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            Text(
              title,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
            ),
            Text(
              instructor,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
