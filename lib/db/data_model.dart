import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';
@HiveType(typeId: 1)
class StudentModel {
  StudentModel({required this.name, required this.age} );
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;
}