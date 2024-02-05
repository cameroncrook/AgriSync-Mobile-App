import 'package:flutter/material.dart';
import '../../utilities/taskFunctions.dart';

class TaskDetails extends StatefulWidget {
  final int taskId;

  TaskDetails({required this.taskId});

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  late Map<String, dynamic> taskData = {
    "name": "Fix fence by canal",
    "priority": "Urgent",
    "assigned_to": "Jayden",
    "status": 4,
    "description": "Cows broke out of the fence by the bridge in the lower field. Needs to get fixed ASAP",
    "stuckMessage": ""
  };

  final List<int> statusData = [1,2,3,4];

  int? _status;

  @override
  Widget build(BuildContext context) {
    String status = translateStatus(taskData['status']);
    _status = taskData['status'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getStatusColor(taskData["status"]),
        actions: const <IconButton>[
          IconButton(
            icon: Icon(Icons.edit, size: 30),
            tooltip: 'Edit details',
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.delete, size: 30),
            tooltip: "Delete",
            onPressed: null,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              taskData['name'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    'Assigned To',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(taskData['assigned_to']),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      'Priority',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(taskData['priority']),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(translateStatus(taskData['status']))
                  ],
                ),
              ],
            ),
            Text(taskData['description']),
          ],
        ),
      ),
    );
  }
}