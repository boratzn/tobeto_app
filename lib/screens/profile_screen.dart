import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedOption = "Option 1";
  GlobalKey iconKey = GlobalKey();
  bool isShared = false;
  List<bool?> isOpen = <bool>[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoaded) {
          var userData = state.userInfo;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return InkWell(
                          onTap: () {
                            ref.read(pageIndexProvider.notifier).state = 5;
                          },
                          child: Image.asset(
                            edit2ImagePath,
                            height: 50,
                            width: 50,
                          ),
                        );
                      },
                    ),
                    InkWell(
                      key: iconKey,
                      onTap: () {
                        final RenderBox buttonBox = iconKey.currentContext!
                            .findRenderObject() as RenderBox;
                        final buttonPosition =
                            buttonBox.localToGlobal(Offset.zero);
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            buttonPosition.dx, // x pozisyonu
                            buttonPosition.dy, // y pozisyonu
                            MediaQuery.of(context).size.width -
                                buttonPosition.dx, // genişlik
                            MediaQuery.of(context).size.height -
                                buttonPosition.dy, // yükseklik
                          ),
                          items: [
                            PopupMenuItem<String>(
                              value: 'Option 1',
                              child: ListTile(
                                title: Text(
                                  "Profilimi paylaş",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 16),
                                ),
                                trailing: Switch(
                                  value: isShared,
                                  onChanged: (value) {
                                    setState(() {
                                      isShared = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            PopupMenuItem<String>(
                                value: 'Option 2',
                                child: ListTile(
                                  title: Text(
                                    "Profil Linki Kopyala",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 16),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.copy_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        size: 35,
                                      )),
                                )),
                          ],
                        ).then((value) {
                          setState(() {
                            if (value != null) {
                              selectedOption =
                                  value; // Seçilen seçeneği güncelle
                            }
                          });
                        });
                      },
                      child: Image.asset(
                        shareImagePath,
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
                //******************************INFORMATION CARD***************************** */
                InformationSection(userData: userData),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                //**************************ABOUT ME******************************* */

                AboutMeSection(userData: userData),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                //**************************SKILLS************************** */
                SingleChildScrollView(
                    child: SkillsSection(skillList: userData!.skills)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                //***************************** LANGUAGES *************************** */
                SingleChildScrollView(
                  child: LanguagesSection(
                    languages: userData.languages,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                //******************************* CERTİFİCATES ************************ */
                const CertificatesSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                //******************************** SOCIAL MEDYA ************************* */
                const SocialMediaSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                //******************************** ACHIVEMENT MODEL *********************** */
                const AchivementModelSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                //************************* TOBETO EXAMS *************************** */
                const ExamsSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                //***************************  MY BADGES **************************/
                const BadgesSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                //*************************** ACTIVITIES MAP *************************** */
                const ActivityMapSection(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                //*************************** MY EDUCATİON AND EXPERİENCES ************************* */
                SizedBox(
                    height: userData.business!.isNotEmpty ||
                            userData.education!.isNotEmpty
                        ? MediaQuery.of(context).size.height * 0.36
                        : MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: const EducationAndExperiencesSection()),
              ],
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
