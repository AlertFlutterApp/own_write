import 'package:flutter/material.dart';

import '../../pages/add_to_do_page.dart';

class MyFloatingActionButton extends StatelessWidget {
  // the MyFloatingActionButton is the
  // floating action button of the home.dart
  // file.
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // if user press the button, it will
        // send him / her to the AddTask page in
        // pages/add_to_do_page.dart file.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddTask();
            },
          ),
        );
      },
    );
  }
}
