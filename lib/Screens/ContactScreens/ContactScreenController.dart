import 'package:flutter/material.dart';
import 'package:project_citex/Screens/ContactScreens/ContactScreenSmallSize.dart';
import 'package:project_citex/Screens/ContactScreens/ContactScreensFullSize.dart';

class ContactScreenController extends StatefulWidget {
  const ContactScreenController({Key? key}) : super(key: key);

  @override
  State<ContactScreenController> createState() =>
      _ContactScreenControllerState();
}

class _ContactScreenControllerState extends State<ContactScreenController> {
  Widget getW(w) {
    if (w >= 1050) {
      return const ContactScreenFullSize();
    } else {
      return const ContactScreenSmallSize();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return getW(width);
  }
}
