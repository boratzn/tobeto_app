import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anketlerim",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      body: list.isNotEmpty
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return null;
              },
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFFE6E6E6),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        anketImagePath,
                        scale: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Atanmış herhangi bir anketiniz\nbulunmamaktadır.",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color(0xFF6A359F),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
