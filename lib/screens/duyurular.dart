import 'package:flutter/material.dart';

class Anouncements extends StatelessWidget {
  const Anouncements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF00956E),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5),
                child: Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(3),
                        topLeft: Radius.circular(3)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.5), // Gölge rengi ve opaklığı
                        spreadRadius: 5, // Gölge yayılma alanı
                        blurRadius: 7, // Gölge bulanıklık yarıçapı
                        offset:
                            const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Duyuru",
                              style: TextStyle(color: Color(0xFF00956E)),
                            ),
                            Text(
                              "İstanbul Kodluyor",
                              style: TextStyle(color: Color(0xFF00956E)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Yeni Grupların Discord'a Katılımı",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF767676),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "23.11.2023",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xFF9397A0)),
                                )
                              ],
                            ),
                            TextButton(
                                style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () {},
                                child: const Text(
                                  "Devamını Oku",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF9397A0)),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF00956E),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5),
                child: Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(3),
                        topLeft: Radius.circular(3)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.5), // Gölge rengi ve opaklığı
                        spreadRadius: 5, // Gölge yayılma alanı
                        blurRadius: 7, // Gölge bulanıklık yarıçapı
                        offset:
                            const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Duyuru",
                              style: TextStyle(color: Color(0xFF00956E)),
                            ),
                            Text(
                              "İstanbul Kodluyor",
                              style: TextStyle(color: Color(0xFF00956E)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Yeni Grupların Discord'a Katılımı",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF767676),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "23.11.2023",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xFF9397A0)),
                                )
                              ],
                            ),
                            TextButton(
                                style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () {},
                                child: const Text(
                                  "Devamını Oku",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF9397A0)),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
