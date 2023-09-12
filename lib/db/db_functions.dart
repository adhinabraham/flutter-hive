import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import 'data_model.dart';

 ValueNotifier<List<StudentModel>> studentListNotifer = ValueNotifier([]);

Future<void> addStudent(StudentModel value ) async {
   // studentListNotifer.value.add(value);
   final studentDB =  await Hive.openBox<StudentModel>("student_db");
  await studentDB.add(value);
  getAllStudent();
}

Future<void> getAllStudent() async {
 final studentDB =  await Hive.openBox<StudentModel>("student_db");
 studentListNotifer.value.clear();
 studentListNotifer.value.addAll(studentDB.values);
 studentListNotifer.notifyListeners();
}