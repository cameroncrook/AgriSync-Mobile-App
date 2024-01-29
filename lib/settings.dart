import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Map<String, dynamic> settings = {
    "first_name": "Cameron",
    "last_name": "Crook",
    "farm_name": "Crook Farms",
    "farm_code": "15639",
    "collaborators_num": "5",
    "isOwner": true,
    "isAdmin": true,
    "tasks": true,
    "agriculture": true,
    "cattle": true
  };

  @override
  Widget build(BuildContext context) {

    // Big Deal options to display at the bottom (based off of user permissions in the farm)
    List<ElevatedButton> adminOptions = [
      ElevatedButton(
        onPressed: null, 
        child: Text("Switch Farm"),
      ),
      ElevatedButton(
        onPressed: null, 
        child: Text("Add Farm")
      ),
    ];

    if (settings['isOwner']) {
      // Give option to delete farm
    } else {
      // Give option to leave farm
    }

    // Display account details first then farm details
    // If not admin, then they cannot change farm details
    return Center(
      child: Text("Settings"),
    );
  }
}