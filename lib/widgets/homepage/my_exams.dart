import 'package:flutter/material.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/widgets/homepage/exams_card.dart';

class MyExams extends StatelessWidget {
  const MyExams({
    super.key,
    required this.userInfo,
  });

  final UserAllInfo userInfo;

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
              userInfo.exams!.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: userInfo.exams!.length,
                        itemBuilder: (context, index) {
                          var exam = userInfo.exams![index];
                          return ExamsCard(
                              title: exam.title ?? "",
                              content: exam.subtitle ?? "",
                              time: exam.time ?? "45 Dakika",
                              isDone: exam.isDone ?? false);
                        },
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Text(
                          "Henüz atanmış ya da tamamlanan bir sınavınız bulunmamaktadır",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 17)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
