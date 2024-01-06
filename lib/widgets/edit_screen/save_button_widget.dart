import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget(
      {super.key, required this.onTap, this.color, this.title});

  final Function() onTap;
  final Color? color;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                color ?? Theme.of(context).colorScheme.primary)),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title ?? "Kaydet",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
