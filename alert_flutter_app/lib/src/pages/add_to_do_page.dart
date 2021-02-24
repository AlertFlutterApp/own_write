import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../mixin/add_task_mixin.dart';

class AddTask extends StatefulWidget {
  _AddTaskState createState() {
    return _AddTaskState();
  }
}

class _AddTaskState extends State<AddTask> with AddTaskValidation {
  // we use the "with" keyword because
  // we need to import the form validations
  // from mixin file in
  // mixin/add_task_mixin.dart
  // to make our code more beautiful.
  final formKey = GlobalKey<FormState>();
  String title = "";

  Widget build(BuildContext context) {
    // this class will return a column for add a new task
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Task"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              titleField(),
              emptyPlace(),
              FlatButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  );
                },
                child: Text("click"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: sendButton(),
    );
  }

  Widget titleField() {
    // this is the titlefield of the
    return TextFormField(
      onSaved: (value) {
        title = value;
      },
      validator: taskTitle,
      decoration: InputDecoration(
        labelText: "Task Title",
      ),
    );
  }

  Widget emptyPlace() {
    return Container(
      margin: EdgeInsets.only(top: 20),
    );
  }

  Widget sendButton() {
    return FloatingActionButton.extended(
      onPressed: () async {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          await Hive.box("tasks").add([title]);
          Navigator.pop(context);
        }
      },
      label: Text(
        "Done!",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      icon: Icon(Icons.send),
    );
  }
}
