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
          shadowColor: Colors.black,
          elevation: 2),
      body: list.isNotEmpty
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return null;
              },
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
