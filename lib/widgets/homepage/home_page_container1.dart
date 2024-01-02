import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/index.dart';

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
        color: Theme.of(context).colorScheme.surface,
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
                  aspectRatio: 4 / 1,
                  child: Image.asset(
                    MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? iKLogoPath
                        : iKDarkLogoPath,
                  )),
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
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                            child: Text(
                              "Başvurularım",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        : Text(
                            "Başvurularım",
                            style: Theme.of(context).textTheme.bodySmall,
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
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                            child: Text(
                              "  Eğitimlerim  ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        : Text(
                            "  Eğitimlerim  ",
                            style: Theme.of(context).textTheme.bodySmall,
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
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                            child: Text(
                              "Duyuru ve Haberlerim",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        : Text(
                            "Duyuru ve Haberlerim",
                            style: Theme.of(context).textTheme.bodySmall,
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
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                            child: Text(
                              "Anketlerim",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        : Text(
                            "Anketlerim",
                            style: Theme.of(context).textTheme.bodySmall,
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
