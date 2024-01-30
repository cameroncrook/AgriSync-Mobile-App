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
    List<ElevatedButton> adminOp = [
      ElevatedButton(
        onPressed: null, 
        child: Text("Switch Farm"),
      ),
      ElevatedButton(
        onPressed: null, 
        child: Text("Add Farm")
      ),
    ];

    ElevatedButton? adminOption;

    if (settings['isOwner']) {
      // Give option to delete farm
      adminOption = ElevatedButton(
        onPressed: null, 
        child: Text("Delete Farm")
      );
    } else {
      // Give option to leave farm
      adminOption = ElevatedButton(
        onPressed: null, 
        child: Text("Leave Farm")
      );
    }

    // Display account details first then farm details
    // If not admin, then they cannot change farm details
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              children: <Widget>[
                const Text("First Name"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: settings['first_name'],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Text("Last Name"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: settings['last_name'],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <ElevatedButton>[
                ElevatedButton.icon(
                  onPressed: null, 
                  icon: const Icon(Icons.exit_to_app), 
                  label: const Text("Sign Out"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                  ),
                )
              ],
            ),
            const Text(
              "Farm",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              children: <Widget>[
                const Text("Farm Name"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: settings['farm_name'],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Farm Share Code",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0
                      ),
                    ),
                    child: Center(
                      child: Text(
                        settings['farm_code'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(settings['collaborators_num']),
                            Icon(
                              Icons.person,
                            ),
                          ],
                        ),
                        const Text("Manage Collaborators")
                      ],
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}