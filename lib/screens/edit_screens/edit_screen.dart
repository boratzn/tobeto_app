import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/screens/edit_screens/account_settings.dart';
import 'package:tobeto_app/screens/edit_screens/business_information.dart';
import 'package:tobeto_app/screens/edit_screens/education_information.dart';
import 'package:tobeto_app/screens/edit_screens/skills_information.dart';
import 'package:tobeto_app/screens/edit_screens/user_informations.dart';

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
    _tabController = TabController(length: 8, vsync: this); // Toplamda 3 sekme
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              UserInformations(),
              BusinessInformation(),
              EducationInformation(),
              SkillsInformation(),
              Center(child: Text('Tab 3 Content')),
              Center(child: Text('Tab 3 Content')),
              Center(child: Text('Tab 3 Content')),
              AccountSettings()
            ],
          ),
        )
      ],
    );
  }
}
