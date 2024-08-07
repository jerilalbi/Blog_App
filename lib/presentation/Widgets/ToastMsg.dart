import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toastMsg(String msg, Color color) {
  return Fluttertoast.showToast(
      msg: msg, backgroundColor: color, textColor: Colors.white);
}
