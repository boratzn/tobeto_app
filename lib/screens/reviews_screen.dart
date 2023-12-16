import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Değerlendirmeler"),
    );
  }
}