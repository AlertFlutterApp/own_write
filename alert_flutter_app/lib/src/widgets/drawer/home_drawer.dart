import 'package:flutter/material.dart';

import 'header.dart';
import 'theme_list_tile.dart';
import 'about_list_tile.dart';

class HomeDrawer extends StatelessWidget {
  // The drawer of the home.dart file
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          HeaderListTile(),
          ThemeListTile(),
          About(),
        ],
      ),
    );
  }
}
