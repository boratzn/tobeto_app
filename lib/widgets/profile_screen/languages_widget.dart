import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';

import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/utils/utils.dart';

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.index,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Icon? icon;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: ListTile(
        leading: Image.asset(globeImagePath),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 20,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black54
                    : Colors.white,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black45
                    : Colors.white,
              ),
        ),
        trailing: icon != null
            ? IconButton(
                onPressed: () {
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
                            "Bu bilgiyi silmek istediğinize emin misiniz?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 18)),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
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
                              if (index != null) {
                                context
                                    .read<UserDataBloc>()
                                    .add(DeleteLanguageInfoById(index: index!));
                                Navigator.pop(context);
                              }
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
                icon: icon!,
              )
            : Image.asset(homeImagePath),
      ),
    );
  }
}
