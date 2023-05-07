import 'package:flutter/material.dart';

Future<void> dialogHandler(BuildContext context, Widget child) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}
