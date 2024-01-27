import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/profile_screen/rating_container_widget.dart';

class AchivementModelSection extends StatelessWidget {
  const AchivementModelSection({
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tobeto İşte Başarım Modelim",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(onTap: () {}, child: Image.asset(eyeImagePath))
              ],
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(
                chartImagePath,
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.grey
                        : null,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RatingContainerWidget(
                        text: "Yeni dünyaya hazırlanıyorum",
                        rating: "3.6",
                        color: Color(0xFF85A0A9)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Profesyonel duruşumu geliştiriyorum",
                        rating: "4.7",
                        color: Color(0xFF217925)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Kendimi tanıyor ve yönetiyorum",
                        rating: "4.5",
                        color: Color(0xFFEEC272)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Yaratıcı ve doğru çözümler geliştiriyorum",
                        rating: "4.3",
                        color: Color(0xFF6667AB)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Kendimi sürekli geliştiriyorum",
                        rating: "4.9",
                        color: Color(0xFFE288B6)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Başkaları ile birlikte çalışıyorum",
                        rating: "4.6",
                        color: Color(0xFFB38F6A)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Sonuç ve başarı odaklıyım",
                        rating: "4.5",
                        color: Color(0xFFD75078)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const RatingContainerWidget(
                        text: "Anlıyorum ve anlaşılıyorum",
                        rating: "4.4",
                        color: Color(0xFFD77E6F)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
