import 'package:flutter/material.dart';
import '../../models/field_group.dart';

class FieldGroupCard extends StatelessWidget {
  final FieldGroup group;

  const FieldGroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            group.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}