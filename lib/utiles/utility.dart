import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utility {
  static Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  static double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  // convert Date
  static String convertDate(String date) {
    String dateFormat =
        DateFormat("MMMM dd, yyyy").format(DateTime.parse(date));
    return dateFormat;
  }

  // get Budget Name

  static void showSnackBar(_scaffoldKey, msg, context) {
    _scaffoldKey.currentState.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("$msg"),
      duration: Duration(seconds: 3),
    ));
  }
}
