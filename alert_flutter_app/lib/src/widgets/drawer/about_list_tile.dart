import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  // This is a about listtile in drawer of home.dart file
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("About"),
      leading: Icon(Icons.menu_book_rounded),
      onTap: () {
        // when the user clicks on the listtile,
        // it will show the aboutdialog.
        showAboutDialog(
          // https://api.flutter.dev/flutter/material/AboutDialog-class.html
          context: context,
          applicationIcon: Image.asset(
            "assets/logo.png",
            fit: BoxFit.scaleDown,
            width: 128,
            height: 128,
          ),
          applicationName: "alert app",
          applicationVersion: "1.0.0",
          applicationLegalese:
              "This is a ToDo application. powered by alert_flutter_team.",
        );
      },
    );
  }
}
