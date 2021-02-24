import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeListTile extends StatelessWidget {
  bool darkMode = Hive.box('theme').get('dark_mode', defaultValue: false);
  @override
  // this is a listtile that the user can change
  // the theme dark / light with a switch.
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(darkMode ? "dark mode" : "light mode"),
      leading: Icon(darkMode ? Icons.nights_stay : Icons.wb_sunny),
      trailing: Switch(
        value: darkMode,
        onChanged: (val) {
          // when the user click on the switch,
          // the program will change the value
          // in "theme" database.
          Hive.box("theme").put('dark_mode', !darkMode);
        },
      ),
    );
  }
}
