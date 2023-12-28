import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/screens/index.dart';

class HomePageContainer1 extends StatefulWidget {
  const HomePageContainer1({
    super.key,
  });

  @override
  State<HomePageContainer1> createState() => _HomePageContainer1State();
}

class _HomePageContainer1State extends State<HomePageContainer1> {
  int currIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screens = const [
      MyApplications(),
      Educations(),
      Anouncements(),
      MySurveys()
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15), // Opsiyonel: Köşeleri yuvarlama
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Gölge rengi ve opaklığı
            spreadRadius: 2, // Gölge yayılma alanı
            blurRadius: 3, // Gölge bulanıklık yarıçapı
            offset: const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: AspectRatio(
                  aspectRatio: 4 / 1, child: Image.asset(iKLogoPath)),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Ücretsiz eğitimlerle,\ngeleceğin \nmesleklerinde sen de \nyerini al.',
                      style: TextStyle(fontSize: 22),
                    ),
                    TextSpan(
                        text: '\nAradığın ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '“',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5AE2BE))),
                    TextSpan(
                        text: 'İş',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '”',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5AE2BE))),
                    TextSpan(
                        text: '\nBurada!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currIndex = 0;
                      });
                    },
                    child: currIndex == 0
                        ? Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 2.0))),
                            child: const Text(
                              "Başvurularım",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black54),
                            ),
                          )
                        : const Text(
                            "Başvurularım",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black54),
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currIndex = 1;
                      });
                    },
                    child: currIndex == 1
                        ? Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 2.0))),
                            child: const Text(
                              "  Eğitimlerim  ",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black54),
                            ),
                          )
                        : const Text(
                            "  Eğitimlerim  ",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black54),
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currIndex = 2;
                      });
                    },
                    child: currIndex == 2
                        ? Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 2.0))),
                            child: const Text(
                              "Duyuru ve Haberlerim",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black54),
                            ),
                          )
                        : const Text(
                            "Duyuru ve Haberlerim",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black54),
                          ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currIndex = 3;
                      });
                    },
                    child: currIndex == 3
                        ? Container(
                            decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(width: 2.0))),
                            child: const Text(
                              "Anketlerim",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black54),
                            ),
                          )
                        : const Text(
                            "Anketlerim",
                            style:
                                TextStyle(fontSize: 22, color: Colors.black54),
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            screens[currIndex]
          ],
        ),
      ),
    );
  }
}
