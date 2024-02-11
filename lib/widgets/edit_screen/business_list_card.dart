import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/models/business.dart';
import 'package:tobeto_app/utils/utils.dart';

class BusinessListCard extends StatelessWidget {
  const BusinessListCard({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final Business item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Color(0xFFC579FF),
                    ),
                    Text(
                      "${getDateStringFormat(item.startDate)} - ${getDateStringFormat(item.endDate)}",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? const Color(0xFFC579FF)
                              : const Color(0xFF822BD9)),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: SizedBox(
                            width: item.workDescription!.isEmpty
                                ? MediaQuery.of(context).size.width * 0.5
                                : MediaQuery.of(context).size.width,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "İş Açıklaması",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 20),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item.workDescription ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontSize: 18),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Kapat",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.more_horiz_outlined,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.grey
                          : Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kurum Adı",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.grey[700]
                                        : Colors.grey[400]),
                          ),
                          Text(item.companyName ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pozisyon",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.grey[700]
                                        : Colors.grey[400]),
                          ),
                          Text(item.position ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sektör",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.grey[700]
                                        : Colors.grey[400]),
                          ),
                          Text(item.sector ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Şehir",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 18,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.grey[700]
                                        : Colors.grey[400]),
                          ),
                          Text(item.province ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18))
                        ],
                      ),
                    ],
                  )),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Uyarı",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 18)),
                        content: Text(
                            "Bu bilgiyi silmek istediğinizde emin misiniz?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 18)),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              showToast(message: "Silme işlemi gerçekleşmedi.");
                            },
                            child: Text(
                              "Hayır",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<UserDataBloc>()
                                  .add(DeleteBusinessInfoById(index: index));
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Evet",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.delete),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
