import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/widgets/edit_screen/skills_card.dart';
import 'package:tobeto_app/widgets/index.dart';

class SkillsInformation extends StatefulWidget {
  const SkillsInformation({super.key});

  @override
  State<SkillsInformation> createState() => _SkillsInformationState();
}

class _SkillsInformationState extends State<SkillsInformation> {
  OptionItem optionItemSelected = OptionItem(title: "Seçiniz");
  List<String> selectedOptions = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoaded) {
          var skills = state.userInfo!.skills;
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
                    "Yetkinlik*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SelectDropMultipleList(
                    defaultText: optionItemSelected,
                    dropListModel: dropListModel,
                    showIcon: false,
                    showBorder: true,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingLeft: 0,
                    paddingRight: 0,
                    submitText: "OK",
                    colorSubmitButton: const Color(0xFF850BEC),
                    selectedIconWidget: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle, color: Color(0xFF850BEC)),
                      child: const Icon(
                        Icons.done,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Icons.arrow_drop_down,
                    containerPadding: const EdgeInsets.all(10),
                    icon: const Icon(Icons.person, color: Colors.black),
                    onOptionListSelected: (list) {
                      selectedOptions.clear();
                      for (var data in list) {
                        if (data.id != null) {
                          selectedOptions.add(data.title);
                        }
                      }
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 10,
                  ),
                  SaveButtonWidget(
                    onTap: () {
                      context.read<UserDataBloc>().add(SkillsUpdate(skills: [
                            for (var skillName in selectedOptions)
                              Skill(skillName: skillName)
                          ]));
                      selectedOptions.clear();
                    },
                  ),
                  //Buraya yetkinlikler gelecek
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                      itemCount: skills!.length,
                      itemBuilder: (context, index) {
                        var item = skills[index];
                        return SkillsCard(
                          title: item.skillName ?? "",
                          onTap: () {},
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
