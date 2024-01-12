import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/reviewpage/review_page_container.dart';
import 'package:tobeto_app/widgets/reviewpage/reviewpage_button_list.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const ReviewPageContainer(),
          const ReviewButtonList(),
          //------------------------
          
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: 'Aboneliğe özel ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28,
                    )),
                const TextSpan(text: 'değerlendirme araçları için :')
              ])),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal, 
              children: [
                Container(
                    height: 260,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFF1D0B8C),
                              Color.fromARGB(255, 145, 69, 168),
                              Color(0xFFE6E7EC)
                            ]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    width: 360,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Kazanım Odaklı Testler",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              "Dijital gelişim\nkategorisindeki eğitimlere \nbaşlamadan önce konuyla\nilgili bilgin ölçülür ve\nseviyene göre\nyönlendirilirsin.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Container(
                    height: 400,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 109, 34, 196),
                              //  Color.fromARGB(255, 85, 46, 215),
                              Color.fromARGB(255, 135, 165, 236),
                              //Color.fromARGB(255, 145, 69, 168),
                              Color(0xFFE6E7EC)
                            ]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    width: 360,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Huawei Talent Interview \nTeknik Bilgi Sınavı*",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              "\nSertifika alabilmen için,\neğitim yolculuğunun sonunda \nteknik yetkinliklerin \nve kod bilgin ölçülür.\n\n400+ soru | 30+ programlama dili \n4 zorluk seviyesi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text(
                              "\n\n*Türkiye Ar-Ge Merkezi tarafından tasarlanmıştır.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )),
              ],
            ),
          ),

          const SizedBox(
            height: 45,
          ),
        ]),
      ), //
    );
  }
}
