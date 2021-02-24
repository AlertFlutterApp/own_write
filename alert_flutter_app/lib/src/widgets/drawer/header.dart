import 'package:flutter/material.dart';

class HeaderListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the header of the drawer of the home.dart file
    return DrawerHeader(
      child: Container(
        color: Colors.orange,
        child: Center(
          child: Text("This is a header"),
        ),
      ),
    );
  }
}
