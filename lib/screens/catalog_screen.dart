import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Katalog"),
    );
  }
}