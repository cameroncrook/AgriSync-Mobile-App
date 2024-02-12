import 'package:flutter/material.dart';
import '../../models/field.dart';
import '../../models/field_group.dart';
import './field_group_card.dart';
import './field_card.dart';

class Fields extends StatefulWidget {
  @override

  _FieldsState createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    // Test group data
    var group1 = FieldGroup(name: "Granpas");
    var group2 = FieldGroup(name: "Dry Farm");
    var group3 = FieldGroup(name: "Lower Field");

    List<FieldGroup> groups = [group1, group2, group3];

    // Test field data
    var field1 = Field(name: "Grandpas bottom 20", acre: 20);
    var field2 = Field(name: "25 Acres", acre: 25);
    var field3 = Field(name: "Bottom 40", acre: 40);

    List<Field> fields = [field1, field2, field3];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text("Groups", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return FieldGroupCard(group: groups[index]);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Fields", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: fields.length,
            itemBuilder: (context, index) {
              return FieldCard(field: fields[index]);
            }
          ),
        ],
      ),
    );
  }
}