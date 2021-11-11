import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  AdaptiveButton(this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              "Choose Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : OutlinedButton(
            onPressed: handler,
            child: Text(
              "Choose Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
