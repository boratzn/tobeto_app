import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/edit_screen/save_button_widget.dart';
import 'package:tobeto_app/widgets/edit_screen/social_media_card.dart';

class SocialMediaInformation extends StatefulWidget {
  const SocialMediaInformation({super.key});

  @override
  State<SocialMediaInformation> createState() => _SocialMediaInformationState();
}

class _SocialMediaInformationState extends State<SocialMediaInformation> {
  OptionItem optionItemSelected = OptionItem(title: "Select Social Media");
  var urlController = TextEditingController();
  var urlUpdateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoaded) {
          var sMedia = state.userInfo!.socialMedias;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  Text(
                    "Sosyal Medya",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                  ),
                  SelectDropList(
                    itemSelected: optionItemSelected,
                    dropListModel: sMediaList,
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: urlController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        hintText: "https://",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  SaveButtonWidget(
                    onTap: () {
                      context.read<UserDataBloc>().add(SocialUpdate(
                              socialMedia: [
                                SocialMedia(
                                    name: optionItemSelected.title,
                                    url: urlController.text)
                              ]));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                      itemCount: sMedia!.length,
                      itemBuilder: (context, index) {
                        var item = sMedia[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 30),
                          child: SocialMediaCard(
                            title: item.name ?? "",
                            url: item.url ?? "",
                            index: index,
                            onPressed: () => openModelSheet(item, index),
                          ),
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

  Future<void> openModelSheet(SocialMedia item, int index) async {
    urlUpdateController.text = item.url!;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Güncelle",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 19),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                TextFormField(
                  controller: urlUpdateController,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 17),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      hintText: "https://",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                SaveButtonWidget(
                  onTap: () {
                    context.read<UserDataBloc>().add(UpdateSocialMediaInfoById(
                        index: index,
                        sm: SocialMedia(
                            name: item.name, url: urlUpdateController.text)));
                    Navigator.pop(context);
                    showToast(
                        message: '${item.name} bilgisi başarıyla güncellendi.');
                  },
                  title: "Güncelle",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
