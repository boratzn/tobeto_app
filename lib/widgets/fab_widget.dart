import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double buttonSize = 70;

class FabWidget extends StatefulWidget {
  const FabWidget({super.key});

  @override
  State<FabWidget> createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget> {
  @override
  Widget build(BuildContext context) => SpeedDial(
        overlayColor: Colors.black12,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            onTap: () {},
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.messenger,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            onTap: () {},
            backgroundColor: Colors.green,
            child: const Icon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
            ),
          ),
        ],
      );
}
