import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'widgets/agriculture_widgets/hayInput.dart';
import './widgets/agriculture_widgets/fields.dart';

class Agriculture extends StatefulWidget {
  const Agriculture({super.key});
  @override

  _AgricultureState createState() => _AgricultureState();
}

class _AgricultureState extends State<Agriculture> {
  int _selectedIndex = 0;

  final List<Widget> bottomNavItems = <Widget>[
    Fields(),
    Text(
      'Stats',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    HayTracker()
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
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: "Record Hay"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bottomNavItems.elementAt(_selectedIndex),
      ),
    );
  }
}