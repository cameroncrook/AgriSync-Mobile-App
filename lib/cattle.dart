import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'widgets/cattle_widgets/Herd.dart';

class Cattle extends StatefulWidget {
  const Cattle();

  @override
  _CattleState createState() => _CattleState();
}

class _CattleState extends State<Cattle> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Herd(),
    Text(
      'Search Page',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile Page',
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
            icon: Icon(CommunityMaterialIcons.barn),
            label: 'Herd'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Tools'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}