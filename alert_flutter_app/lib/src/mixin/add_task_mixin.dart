class AddTaskValidation {
  // this class is for the validation of forms
  // in our program.
  String taskTitle(String value) {
    // this is for the title of th "add ToDo" page.
    if (value.isEmpty) {
      // check the value in the TextField;
      // if that is empty:
      return "Please enter a title";
    }
    // else:
    return null;
  }
}
