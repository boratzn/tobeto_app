import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/screens/calendar_screen.dart';
import 'package:tobeto_app/screens/catalog_screen.dart';
import 'package:tobeto_app/screens/home_screen.dart';
import 'package:tobeto_app/screens/profile_screen.dart';
import 'package:tobeto_app/screens/reviews_screen.dart';
import 'package:tobeto_app/widgets/fab_widget.dart';

import '../widgets/drawer_menu.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    ReviewsScreen(),
    ProfileScreen(),
    CatalogScreen(),
    CalendarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            shadowColor: Colors.black,
            title: Image.asset(
              tobetoLogoPath,
              width: 200,
            ),
            elevation: 1),
        endDrawer: const DrawerMenu(),
        body: Consumer(
          builder: (context, ref, child) {
            final index = ref.watch(pageIndexProvider);
            return screens[index];
          },
        ),
        backgroundColor: const Color.fromARGB(255, 247, 244, 244),
        floatingActionButton: const FabWidget(),
      ),
    );
  }
}
