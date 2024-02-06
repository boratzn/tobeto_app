import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/screens/screen_index.dart';

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
      ApplicationScreen(),
      ClassesScreen(),
      AnouncementScreen(),
      SurveyScreen()
    ];

    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              SizedBox(height: MediaQuery.of(context).size.width / 50),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.',
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
              CarouselSlider.builder(
                  itemCount: pageList.length,
                  itemBuilder: (context, index, realIndex) {
                    var item = pageList[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => screens[index],
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0E0B93), Color(0xFF58AAC5)],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                item.values.first,
                                height: 100,
                                width: 100,
                                color: Colors.white,
                              ),
                              Text(
                                item.keys.first,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: true, aspectRatio: 2, enlargeCenterPage: true))
            ],
          ),
        ),
      ),
    );
  }
}
