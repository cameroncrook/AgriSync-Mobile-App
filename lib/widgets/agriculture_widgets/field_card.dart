import 'package:flutter/material.dart';
import '../../models/field.dart';

class FieldCard extends StatelessWidget {
  final Field field;

  const FieldCard({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              field.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(field.acre.toString()),
          ],
        ),
      ),
    );
  }
}