import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/homepage/my_applications.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [MyApplications(), MyApplications()];
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Başvurularım",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          shadowColor: Colors.black,
          elevation: 1),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1),
            child: item,
          );
        },
      ),
    );
  }
}
