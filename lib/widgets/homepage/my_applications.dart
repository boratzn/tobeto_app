import 'package:flutter/material.dart';

class MyApplications extends StatelessWidget {
  const MyApplications({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF076B34),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.5), // Gölge rengi ve opaklığı
                        spreadRadius: 2, // Gölge yayılma alanı
                        blurRadius: 3, // Gölge bulanıklık yarıçapı
                        offset:
                            const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "İstanbul Kodluyor\nBilgilendirme",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              size: 20,
                              color: Color(0xFF076B34),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "İstanbul Kodluyor Başvuru Formu\nonaylandı",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              size: 20,
                              color: Color(0xFF076B34),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "İstanbul Kodluyor Belge Yükleme\nFormu onaylandı",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 0,
                child: Container(
                  width: 155,
                  decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        bottomStart: Radius.circular(20)),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      "Kabul Edildi",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.height / 20,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF076B34),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.5), // Gölge rengi ve opaklığı
                        spreadRadius: 2, // Gölge yayılma alanı
                        blurRadius: 3, // Gölge bulanıklık yarıçapı
                        offset:
                            const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "İstanbul Kodluyor\nBilgilendirme",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              size: 20,
                              color: Color(0xFF076B34),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "İstanbul Kodluyor Başvuru Formu\nonaylandı",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              size: 20,
                              color: Color(0xFF076B34),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "İstanbul Kodluyor Belge Yükleme\nFormu onaylandı",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                right: 0,
                child: Container(
                  width: 155,
                  decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        bottomStart: Radius.circular(20)),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Text(
                      "Kabul Edildi",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
