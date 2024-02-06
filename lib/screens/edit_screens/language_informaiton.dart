import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class LanguageInformation extends StatefulWidget {
  const LanguageInformation({super.key});

  @override
  State<LanguageInformation> createState() => _LanguageInformationState();
}

class _LanguageInformationState extends State<LanguageInformation> {
  OptionItem optionItemSelected = OptionItem(title: "Dil Seçiniz*");
  OptionItem levelSelected = OptionItem(title: "Seviye Seçiniz*");
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoaded) {
          var languageList = state.userInfo!.languages;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  SelectDropList(
                    itemSelected: optionItemSelected,
                    dropListModel: languages,
                    showIcon: false,
                    showArrowIcon: true,
                    showBorder: true,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingRight: 0,
                    paddingBottom: 0,
                    paddingDropItem: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 20),
                    suffixIcon: Icons.arrow_drop_down,
                    containerPadding: const EdgeInsets.all(10),
                    icon: const Icon(Icons.person, color: Colors.black),
                    onOptionSelected: (optionItem) {
                      optionItemSelected = optionItem;
                      setState(() {});
                    },
                  ),
                  SelectDropList(
                    itemSelected: levelSelected,
                    dropListModel: levels,
                    showIcon: false,
                    showArrowIcon: true,
                    showBorder: true,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingRight: 0,
                    paddingBottom: 0,
                    paddingDropItem: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 20),
                    suffixIcon: Icons.arrow_drop_down,
                    containerPadding: const EdgeInsets.all(10),
                    icon: const Icon(Icons.person, color: Colors.black),
                    onOptionSelected: (optionItem) {
                      levelSelected = optionItem;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  SaveButtonWidget(
                    onTap: () {
                      context
                          .read<UserDataBloc>()
                          .add(LanguageUpdate(language: [
                            Language(
                              language: optionItemSelected.title,
                              level: levelSelected.title,
                            )
                          ]));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 10,
                  ),
                  //Buraya diller gelecek
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                      itemCount: languageList!.length,
                      itemBuilder: (context, index) {
                        var item = languageList[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 50),
                          child: LanguagesWidget(
                              title: item.language ?? "",
                              subtitle: item.level ?? ""),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text("Veriler alınırken hata oluştu."),
        );
      },
    );
  }
}
