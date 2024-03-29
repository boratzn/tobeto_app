import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/screens/edit_screens/edit_index.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserDataLoaded) {
          //var user = state.userInfo;
          return Column(
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                tabs: [
                  Tab(
                    child: SizedBox(child: Image.asset(userImagePath)),
                  ),
                  Tab(
                    child: Image.asset(businessImagePath),
                  ),
                  Tab(
                    child: Image.asset(bookImagePath),
                  ),
                  Tab(
                    child: Image.asset(awardImagePath),
                  ),
                  Tab(
                    child: Image.asset(certificateImagePath),
                  ),
                  Tab(
                    child: Image.asset(globeImagePath),
                  ),
                  Tab(
                    child: Image.asset(translateImagePath),
                  ),
                  Tab(
                    child: Image.asset(settingsImagePath),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    UserInformation(),
                    BusinessInformation(),
                    EducationInformation(),
                    SkillsInformation(),
                    CertificateInformation(),
                    SocialMediaInformation(),
                    LanguageInformation(),
                    AccountSettings()
                  ],
                ),
              )
            ],
          );
        }
        return const Center(
          child: Text("Veriler yüklenemedi.."),
        );
      },
    );
  }
}
