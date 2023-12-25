import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/home_page_bottom_container.dart';
import 'package:tobeto_app/widgets/home_page_container.dart';
import 'package:tobeto_app/widgets/home_page_container1.dart';
import 'package:tobeto_app/widgets/my_exams.dart';

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
            const HomePageContainer1(),
            const SizedBox(
              height: 15,
            ),
            const MyExams(),
            const SizedBox(
              height: 10,
            ),
            const HomePageContainer(
              title: "Profilini Oluştur",
              colors: [Color(0xFF1D0B8C), Color(0xFF604BBB), Color(0xFFE6E7EC)],
            ),
            const SizedBox(
              height: 8,
            ),
            const HomePageContainer(
              title: "Kendini Değerlendir",
              colors: [Color(0xFF0E0B93), Color(0xFF58AAC5)],
            ),
            const SizedBox(
              height: 8,
            ),
            const HomePageContainer(
              title: "Profilini Oluştur",
              colors: [Color(0xFF3C0B8C), Color(0xFFD89CF6)],
            ),
            const SizedBox(
              height: 45,
            ),
            const HomePageBottomContainer()
          ],
        ),
      ),
    );
  }
}
