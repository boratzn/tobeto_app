import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class ExamsCard extends StatelessWidget {
  const ExamsCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  final String title;
  final String content;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.57,
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
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: icon)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  content,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    countDownLogoPath,
                    height: 30,
                    width: 30,
                  ),
                  const Text(
                    " 45 Dakika",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
