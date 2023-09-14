import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';
@HiveType(typeId: 1)
class StudentModel {
  StudentModel({required this.name, required this.age} );
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

   static StudentModel mapEachModal(Map<String, Object?> map){
     final name = map["name"] as String;
     final age  = map["age"] as String;
        StudentModel student = StudentModel(name: name, age:  age);
        return student;
  }
}