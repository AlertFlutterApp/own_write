import 'package:flutter/material.dart';
import '../../mixin/add_task_mixin.dart';

class AddTaskWidget extends StatefulWidget {
  _AddTaskWidgetState createState() {
    return _AddTaskWidgetState();
  }
}

class _AddTaskWidgetState extends State<AddTaskWidget> with AddTaskValidation {
  final formKey = GlobalKey<FormState>();
  String title = "";

  Widget build(BuildContext context) {
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
              selectTime(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleField() {
    print("ef");
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
    print("omid");
    return Container(
      margin: EdgeInsets.only(top: 20),
    );
  }

  Widget selectTime() {
    return ListTile(
      title: Text("time"),
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) {});
      },
    );
  }
}
