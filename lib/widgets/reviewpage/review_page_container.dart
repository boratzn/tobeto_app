import 'package:flutter/material.dart';

class ReviewPageContainer extends StatefulWidget {
  const ReviewPageContainer({super.key});

  @override
  State<ReviewPageContainer> createState() => _ReviewPageContainerState();
}

class _ReviewPageContainerState extends State<ReviewPageContainer> {
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(
                    text: 'Yetkinlik',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28,
                    )),
                const TextSpan(text: 'lerini ücretsiz ölç,'),
                TextSpan(
                    text: '\nbilgi',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 28)),
                const TextSpan(text: 'lerini test et.')
              ])),
          const SizedBox(
            height: 25,
          ),
          Container(
              height: 240,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF1D0B8C),
                        Color(0xFF604BBB),
                        Color(0xFFE6E7EC)
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50))),
              width: 360,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Tobeto İşte Başarı Modeli",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                              text: '80 soru ile yetkinliklerini ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          TextSpan(
                              text: 'ölç,',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '\n önerilen eğitimleri ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          TextSpan(
                              text: 'tamamla,',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '\n rozetini ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          TextSpan(
                              text: 'kazan.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 280,
                      child: ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {},
                        child: const Text(
                          "Raporu Görüntüle",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              )),const SizedBox(
                      height: 25,
                    ),
      Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFF1D0B8C),
                                Color(0xFF604BBB),
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
                            Text("Yazılımda Başarı Testi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(children: [
                                  TextSpan(
                                      text:
                                          'Çoktan seçmeli sorular ile teknik bilgini',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      )),
                                  TextSpan(
                                      text: 'test et.',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: '\n\n↓↓↓↓↓ ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      )),
                                ])),
                          ],
                        ),
                      )),
     ]
      ));
  }
}