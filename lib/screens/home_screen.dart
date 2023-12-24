import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/home_page_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'TOBETO',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: "'ya hoşgeldin \n Onur Erdem.",
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yoculuğunda senin yanında!",
                style: TextStyle(color: Colors.black, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                          child: AspectRatio(
                              aspectRatio: 4 / 1,
                              child: Image.asset(iKLogoPath)),
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
                                      'Ücretsiz eğitimlerle,\ngeleceğin mesleklerinde sen de yerini al.',
                                  style: TextStyle(fontSize: 22),
                                ),
                                TextSpan(
                                    text: '\nAradığın ',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '“',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5AE2BE))),
                                TextSpan(
                                    text: 'İş',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '”',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5AE2BE))),
                                TextSpan(
                                    text: '\nBurada!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0, // Aralardaki boşluk
                          runSpacing: 8.0, // Satırlar arası boşluk
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Başvurularım",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black54),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Eğitimlerim",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black54),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Duyuru ve Haberlerim",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black54),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Anketlerim",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black54),
                                ))
                          ],
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sınavlarım",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 250,
                              child: Card(
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Herkes için\nKodlama 1D\nDeğerlendirme\nSınavı.",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 15,),
                                          Image.asset(doneLogoPath)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text("Herkes için\nKodlama - 1D",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold)),
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
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            const HomePageContainer()
          ],
        ),
      ),
    );
  }
}
