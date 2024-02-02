import 'package:flutter/material.dart';
import 'widgets/dashboard_widgets/ToDoTasks.dart';
import 'api/task_endpoints.dart';

class Dashboard extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {
      "name": "Fix fence by canal",
      "priority": "Urgent",
      "assigned_to": "Jayden",
      "status": 4,
      "id": 1
    },
    {
      "name": "Scatter grass seed in lower field",
      "priority": "Not Urgent",
      "assigned_to": "Anyone",
      "status": 3,
      "id": 2
    },
    {
      "name": "Tag new calf",
      "priority": "Urgent",
      "assigned_to": "Cameron",
      "status": 2,
      "id": 3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <ElevatedButton>[
            ElevatedButton.icon(
              onPressed: null, 
              icon: const Icon(Icons.list), 
              label: const Text("Manage")
            ),
            ElevatedButton.icon(
              onPressed: null, 
              icon: const Icon(Icons.add), 
              label: const Text("Add Task")
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Tasks to Complete",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        FutureBuilder(
          future: getActiveTasks(), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Expanded(child: ToDoTasks(task: snapshot.data!));
            }
          }
        ),
      ],
    );
  }
}

// Expanded(child: ToDoTasks(task: tasks)),