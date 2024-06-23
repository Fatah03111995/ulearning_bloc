import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ComponentUtil {
  static toastErr(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red[400]!.withOpacity(0.8),
        textColor: Colors.black);
  }

  static toastSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green[400]!.withOpacity(0.8),
        textColor: Colors.black);
  }

  static toastInfo(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.grey[400]!.withOpacity(0.8),
        textColor: Colors.black);
  }
}
