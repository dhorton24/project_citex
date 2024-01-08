import 'package:flutter/material.dart';
import 'package:project_citex/Screens/ServicesScreen/ServicesScreenFullSize.dart';
import 'package:project_citex/Screens/ServicesScreen/ServicesScreenSmallSize.dart';


class ServicesScreenController extends StatefulWidget {
  const ServicesScreenController({Key? key}) : super(key: key);

  @override
  State<ServicesScreenController> createState() => _ServicesScreenControllerState();
}

class _ServicesScreenControllerState extends State<ServicesScreenController> {

  Widget getW(w) {
    if (w >= 1050) {
      return const ServicesScreenFullSize();
    } else {
      return const ServicesScreenSmallSize();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return getW(width);
  }
}
