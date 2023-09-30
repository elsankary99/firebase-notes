import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast({required String title, Color? backgroundColor}) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.orange,
      textColor: Colors.white,
      fontSize: 18);
}
