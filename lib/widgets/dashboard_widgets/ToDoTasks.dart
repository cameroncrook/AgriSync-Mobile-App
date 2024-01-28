import 'package:flutter/material.dart';
import 'TaskCard.dart';

// Will mainly display in the dashboard. Shows projects that still need completing
// Wont allow users to interact other than click on individual tasks to go to more detailed view

class ToDoTasks extends StatelessWidget {
  final List<Map<String, dynamic>> task;

  ToDoTasks({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: task.length,
      itemBuilder: (context, index) {
        return TaskCard(
          name: task[index]["name"],
          priority: task[index]["priority"],
          assignedTo: task[index]["assigned_to"],
          status: task[index]["status"],
          id: task[index]["id"]
        );
      },
    );
  }
}