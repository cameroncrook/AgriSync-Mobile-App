import 'package:flutter/material.dart';
import '../../utilities/taskFunctions.dart';
import 'TaskDetails.dart';

// The individual general overview task card that gets displayed in the dashboard
class TaskCard extends StatelessWidget {
  final String name;
  final String priority;
  final String assignedTo;
  final int status;
  final int id;

  TaskCard({
    required this.name,
    required this.priority,
    required this.assignedTo,
    required this.status,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    // Generates the color of the card based on status
    Color cardColor = getStatusColor(status);

    return Card(
      color: cardColor,
      child: ListTile(
        title: Text(name),
        subtitle: Text('Assigned to: $assignedTo'),
        trailing: ElevatedButton(
          child: Text("View"),
          onPressed: () async {
            // Use await to get the result of Navigator.push
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskDetails(taskId: id)),
            );
          },
        ),
      ),
    );
  }
}