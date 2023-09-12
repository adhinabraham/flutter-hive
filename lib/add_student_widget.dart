import 'package:flutter/material.dart';
import 'package:hive_database/db/data_model.dart';
import 'package:hive_database/db/db_functions.dart';

class AddStudentWidget extends StatelessWidget {
   AddStudentWidget({super.key});
   final _nameContoller = TextEditingController();
   final _ageController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _nameContoller,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller:  _ageController,
            obscureText: true, // Use this to hide the password
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            onAddStudentButtonClicked();
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  Future<void> onAddStudentButtonClicked() async{
    print("working here ");
    final _name = _nameContoller.text.trim();
    final _age = _ageController.text.trim();
    if (_name.isEmpty || _age.isEmpty){
      return;
    }
    print("$_name $_age");

    var studentModel = StudentModel(name: _name, age: _age);
    
    addStudent(studentModel);
  }
}
