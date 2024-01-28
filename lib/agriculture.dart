import 'package:flutter/material.dart';
import 'hayInput.dart';

class Agriculture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Row>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HayTracker()));
              }, 
              icon: const Icon(Icons.add), 
              label: const Text('Record Hay'),
            ),
          ],
        ),
      ],
    );
  }
}