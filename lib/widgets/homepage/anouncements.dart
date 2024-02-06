import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class Anouncements extends StatelessWidget {
  const Anouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const AnouncementsCard(
              title: "Yeni Grupların Discord'a Katılımı", date: "23.11.2023"),
          const SizedBox(
            width: 45,
          ),
          const AnouncementsCard(
              title: "Yeni Grupların Discord'a Katılımı", date: "23.11.2023"),
          const SizedBox(
            width: 15,
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
