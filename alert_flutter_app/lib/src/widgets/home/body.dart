import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Body extends StatelessWidget {
  // This class is the body of th main page.
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // make a ValueListenableBuilder to listen to changes to hive db.
      valueListenable: Hive.box("tasks").listenable(),
      builder: (context, box, widget) {
        var itemList = Hive.box('tasks').keys;
        return ListView.builder(
          itemCount: Hive.box('tasks').length,
          itemBuilder: (context, index) {
            print(itemList.runtimeType);
            for (int i = 0; i < itemList.length; i++) {
              print(Hive.box('tasks').get(itemList.elementAt(i))[0]);
            }
            final item = Hive.box('tasks').get(itemList.elementAt(index))[0];
            print(Hive.box('tasks').toMap());
            print(
              "element at $index: ${Hive.box('tasks').keys.elementAt(index)}",
            );
            print(item);
            print(12);
            // ListTile & Divider
            return Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.01,
                // margin: EdgeInsets.all(20),
                height: 150,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.label),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            box.get(itemList.elementAt(index))[0],
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            box.delete(itemList.elementAt(index));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue[900]],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
