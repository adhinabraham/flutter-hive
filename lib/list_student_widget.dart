import 'package:flutter/material.dart';

import 'db/data_model.dart';
import 'db/db_functions.dart';

class ListStudentWidget extends StatelessWidget {
   const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: studentListNotifer,
      builder: (BuildContext context, List<StudentModel> value, Widget? child) {
        return ListView.separated(itemBuilder: (context, index) {
          StudentModel data = value[index];
          return ListTile(
            minVerticalPadding: 20,
            title: Text(" ${data.name} "),
            subtitle: Text("${data.age}"),
            trailing: TextButton.icon(onPressed: (){
              deleteStudent(data);
            }, icon:Icon(Icons.delete), label: Text("delete")),
          );
        }, separatorBuilder: (context, index) {
          return const Divider();
        }, itemCount: value.length,
        );
      }
    );
  }
}
