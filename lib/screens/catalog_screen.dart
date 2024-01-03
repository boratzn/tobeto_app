import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              image: const DecorationImage(
                image: AssetImage('assets/images/catalog_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Öğrenmeye başla !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Eğitim arayın...",
                      hintStyle: const TextStyle(fontSize: 30),
                      prefixIcon: const Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(300, 40),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Filtrele",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/ENK_36573_a8546fa0ff.jpg",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Gürkan İlİşen",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                            Text(
                              "14dk",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/ENK_365670_08eb2bab1a.jpg",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Gürkan İlİşen",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                            Text(
                              "40dk",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Sürdürülebilir bir dünya için bireysel farkındalık.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    right: 10,
                    top: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
