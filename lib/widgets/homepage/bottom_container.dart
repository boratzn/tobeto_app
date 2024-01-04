import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class HomePageBottomContainer extends StatelessWidget {
  const HomePageBottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                tobetoLogoPath,
                color: Colors.white,
                scale: 2.5,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Bize Ulaşın",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ))
            ],
          ),
          const Text(
            "© 2022 Tobeto",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
