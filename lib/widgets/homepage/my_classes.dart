import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/index.dart';

class Educations extends StatelessWidget {
  const Educations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const MyClassesCard(
            imagePath: ecmelPath,
            title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
            date: "21 Eylül 2023 15:20",
          ),
          const SizedBox(
            width: 25,
          ),
          const MyClassesCard(
              imagePath: ikImagePath,
              title: "Eğitimlere Nasıl Katılırım?",
              date: "8 Eylül 2023 17:06"),
          const SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Gölge rengi ve opaklığı
                      spreadRadius: 4, // Gölge yayılma alanı
                      blurRadius: 7, // Gölge bulanıklık yarıçapı
                      offset:
                          const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  "Daha Fazla Göster",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
