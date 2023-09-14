import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sqflite/sqflite.dart';

import 'data_model.dart';

 ValueNotifier<List<StudentModel>> studentListNotifer = ValueNotifier([]);

late Database _db;

 Future <void> initalDataBase () async  {
    _db = await openDatabase("student.db", version: 1,
       onCreate: (Database db, int version) async {
         await db.execute(
             'CREATE TABLE Student ("id" INTEGER PRIMARY KEY, "name" TEXT, "age" TEXT)');
       });
 }

Future <void> getAllStudents () async  {
   print("getting all student from SQflite");
  studentListNotifer.value.clear();
 final value =  await _db.rawQuery('SELECT * FROM Student');
 value.forEach((element) {
   final student  = StudentModel.mapEachModal(element);
   studentListNotifer.value.add(student);
   studentListNotifer.notifyListeners();
 });
 print(value);
 print("query executed ");
}

Future<void> addStudent(StudentModel value ) async {
  _db.rawInsert('INSERT INTO Student (name,age) VALUES (?,?)', [value.name, value.age]);
  getAllStudents();
}

Future<void> deleteStudent(StudentModel value ) async {
  _db.rawDelete('DELETE FROM Student WHERE name = ?', [value.name]);
  getAllStudents();
}
//
// Future<void> getAllStudent() async {
//  final studentDB =  await Hive.openBox<StudentModel>("student_db");
//  studentListNotifer.value.clear();
//  studentListNotifer.value.addAll(studentDB.values);
//  studentListNotifer.notifyListeners();
// }