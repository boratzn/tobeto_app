import 'package:flutter/material.dart';

class ExamsWidget extends StatelessWidget {
  const ExamsWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.score});

  final String title;
  final String date;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.light
                            ? Colors.black54
                            : Colors.grey,
                      ),
                ),
              ),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black54
                          : Colors.grey,
                    ),
              ),
              Text(
                score,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black54
                          : Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
