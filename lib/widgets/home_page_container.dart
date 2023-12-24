import 'package:flutter/material.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50), topRight: Radius.circular(50))),
        width: double.infinity,
        child: Column(
          children: [
          const Text("Profilini oluştur."),
          SizedBox(child: ElevatedButton(onPressed: () {}, child: const Text("Başla",)))
        ]),
      ),
    );
  }
}
