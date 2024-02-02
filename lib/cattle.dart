import 'package:flutter/material.dart';

class Cattle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Statistics'),
            onTap: null,
          ),
        ],
      ),
      body: const Center(child: Text("Cattle"),),
    );
  }
}