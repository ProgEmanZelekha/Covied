import 'package:flutter/material.dart';

class SussesDialog{
  BuildContext context;
  String message;

  SussesDialog({required this.context, required this.message});

  void showError(){
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(message),
        ));
  }
}