import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  final String textInputText;
  MyFloatingActionButton(this.textInputText);
  @override
  _MyFloatingActionButtonState createState() {
    return _MyFloatingActionButtonState();
  }
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.send),
      onPressed: () {
        print(widget.textInputText);
        Navigator.pop(context);
      },
    );
  }
}
