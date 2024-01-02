import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/constants/constants.dart';
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
    CalendarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            shadowColor: Colors.black,
            title: Hero(
              tag: tobetoLogoPath,
              child: Image.asset(
                tobetoLogoPath,
                width: 200,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            elevation: 1),
        endDrawer: const DrawerMenu(),
        body: Consumer(
          builder: (context, ref, child) {
            final index = ref.watch(pageIndexProvider);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [screens[index], const HomePageBottomContainer()],
              ),
            );
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        floatingActionButton: const FabWidget(),
      ),
    );
  }
}
