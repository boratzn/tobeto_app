import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class Educations extends StatelessWidget {
  const Educations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(0.5), // Gölge rengi ve opaklığı
                  spreadRadius: 4, // Gölge yayılma alanı
                  blurRadius: 7, // Gölge bulanıklık yarıçapı
                  offset: const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.asset(
                        ecmelPath,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      "Dr. Ecmel Ayral'dan Hoşgeldin\nMesajı",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "21 Eylül 2023 15:20",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFFD9D9D9))),
                        onPressed: () {},
                        child: const Text(
                          "Eğitime Git",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(0.5), // Gölge rengi ve opaklığı
                  spreadRadius: 4, // Gölge yayılma alanı
                  blurRadius: 7, // Gölge bulanıklık yarıçapı
                  offset: const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.asset(
                        ikImagePath,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text(
                      "Eğitimlere Nasıl Katılırım?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      "8 Eylül 2023 17:06",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFFD9D9D9))),
                        onPressed: () {},
                        child: const Text(
                          "Eğitime Git",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Gölge rengi ve opaklığı
                spreadRadius: 4, // Gölge yayılma alanı
                blurRadius: 7, // Gölge bulanıklık yarıçapı
                offset: const Offset(0, 3), // Gölge kaydırma miktarı (x, y)
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Daha Fazla Göster",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
