import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class MyExams extends StatelessWidget {
  const MyExams({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sınavlarım",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 230,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          15), // Opsiyonel: Köşeleri yuvarlama
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5), // Gölge rengi ve opaklığı
                          spreadRadius: 5, // Gölge yayılma alanı
                          blurRadius: 7, // Gölge bulanıklık yarıçapı
                          offset: Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                        ),
                      ],
                    ),
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
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
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
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )
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
        ),
      ),
    );
  }
}
