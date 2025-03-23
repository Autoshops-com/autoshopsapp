import 'package:flutter/material.dart';
import 'custom_bottom_nav.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _selectedIndex = 2;

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/car');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/service');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/map');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Center(child: Text("This is the Map screen.")),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
