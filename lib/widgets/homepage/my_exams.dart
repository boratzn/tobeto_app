import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/homepage/exams_card.dart';

class MyExams extends StatelessWidget {
  const MyExams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sınavlarım",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ExamsCard(
                        title: "Herkes İçin Kodlama 1B Değerlendirme Sınavı",
                        content: "Herkes İçin Kodlama - 1B",
                        icon: Icon(
                          Icons.done,
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    ExamsCard(
                        title: "Herkes İçin Kodlama 1B Değerlendirme Sınavı",
                        content: "Herkes İçin Kodlama - 1B",
                        icon: Icon(Icons.done)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
