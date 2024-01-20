import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/screens/edit_screens/edit_screen.dart';
import 'package:tobeto_app/screens/index.dart';
import 'package:tobeto_app/widgets/index.dart';

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
    CalendarScreen(),
    EditScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, child) {
          var index = ref.watch(pageIndexProvider);
          return Scaffold(
            appBar: AppBar(
                title: Hero(
                  tag: tobetoLogoPath,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      tobetoLogoPath,
                      width: 150,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                shadowColor: Colors.black,
                elevation: 1),
            endDrawer: const DrawerMenu(),
            body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                screens[index],
                index != 5
                    ? index != 4
                        ? const HomePageBottomContainer()
                        : const Center()
                    : const Center(),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            floatingActionButton: const FabWidget(),
          );
        },
      ),
    );
  }
}
