import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'widgets/agriculture_widgets/hayInput.dart';
import 'dashboard.dart';
import 'agriculture.dart';
import 'cattle.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriSync',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentBody = Dashboard();

  final Map<String, String> farmData = {
    "farm_name": "Crook Farms",
    "user": "Cameron"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(farmData['farm_name']!),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              setState(() {
                _currentBody = Settings();
              });
            },
          ),
          actions: <IconButton>[
            IconButton(
              icon: Icon(Icons.assignment),
              tooltip: "Tasks",
              onPressed: () {
                setState(() {
                  _currentBody = Dashboard();
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.agriculture, size: 30),
              tooltip: 'Feed Production',
              onPressed: () {
                setState(() {
                  _currentBody = Agriculture();
                });
              },
            ),
            IconButton(
              icon: Icon(CommunityMaterialIcons.cow, size: 30),
              tooltip: 'Your Herd',
              onPressed: () {
                setState(() {
                  _currentBody = Cattle();
                });
              },
            )
          ],
        ),
        body: _currentBody,
    );
  }
}
