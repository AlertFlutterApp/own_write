import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/pages/home.dart';

// The main file of the project
void main() async {
  await Hive.initFlutter();
  await Hive.openBox("theme");
  await Hive.openBox("tasks");
  // open "theme" and "tasks" databases.
  runApp(App());
  // run the App class
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // ValueListenableBuilder to listen to changes
      // in theme database to change the theme of
      // the program.
      valueListenable: Hive.box("theme").listenable(),
      builder: (context, box, widget) {
        bool darkMode = Hive.box("theme").get(
          "dark_mode",
          defaultValue: false,
        );
        // the dark_mode value in the "theme" database
        // that is the theme of the program.
        // in the default it is false and the
        // theme is light.
        return MaterialApp(
          theme: darkMode ? ThemeData.dark() : ThemeData.light(),
          home: Home(),
          // return the Home class in
          // src/pages/home.dart
          // file
        );
      },
    );
  }
}
