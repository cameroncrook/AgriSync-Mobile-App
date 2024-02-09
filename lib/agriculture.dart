import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class Agriculture extends StatefulWidget {
  const Agriculture({super.key});
  @override

  _AgricultureState createState() => _AgricultureState();
}

class _AgricultureState extends State<Agriculture> {
  int _selectedIndex = 0;

  final List<Widget> bottomNavItems = <Widget>[
    Text("Fields"),
    Text(
      'Stats',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CommunityMaterialIcons.silo),
            label: "Fields"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: bottomNavItems.elementAt(_selectedIndex),
    );
  }
}