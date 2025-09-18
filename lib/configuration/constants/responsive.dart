import 'package:flutter/widgets.dart';

class Responsive {
  static double height(BuildContext context, double size) {
    return MediaQuery.sizeOf(context).height * size;
  }

  static double width(BuildContext context, double size) {
    return MediaQuery.sizeOf(context).width * size;
  }

  static double fontSize(BuildContext context, double size) {
    return MediaQuery.textScalerOf(context).scale(size);
  }
}
