import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class ExamsCard extends StatelessWidget {
  const ExamsCard({
    super.key,
    required this.title,
    required this.content,
    required this.isDone,
    required this.time,
  });

  final String title;
  final String content;
  final String time;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: isDone ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: isDone
                          ? const Icon(Icons.done)
                          : const Icon(Icons.cancel))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  content,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    countDownLogoPath,
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    " $time",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
