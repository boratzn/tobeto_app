import 'package:flutter/material.dart';

class ReviewButtonList extends StatefulWidget {
  const ReviewButtonList({super.key});

  @override
  State<ReviewButtonList> createState() => _ReviewButtonListState();
}

class _ReviewButtonListState extends State<ReviewButtonList> {
  List<String> exams = <String>[
    "Front End",
    "Full Stack",
    "Back End",
    "Microsoft SQL Server",
    "Masaüstü Programlama"
  ];
  List<String> examsLinks = <String>[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350,
        height: MediaQuery.of(context).size.height * 0.45,
        child:  ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
            padding: const EdgeInsets.all(8),
            itemCount: exams.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFFE6E7EC),
                        Color(0xFF850BEC),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ListTile(
                    leading: const Icon(Icons.list_alt),
                    title: Text(
                      exams[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                        
                    ),
                    trailing: ElevatedButton( style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {

                          
                        },
                        child: const Text(
                          "Başla",
                          style: TextStyle(color: Colors.black),
                        ))),
              );
              //Text(exams[index].toString());
            }
            /*  ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: exams.length,
      itemBuilder: (BuildContext context, int index) {
              //child: Text(exams[index],textAlign: TextAlign.center,),
        ),
        SizedBox(
              width: 350,
              height: 55,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {},
                child:  Text(exam,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ), 
            ); */
            ));
  }
}
