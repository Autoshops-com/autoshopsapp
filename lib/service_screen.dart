import 'package:flutter/material.dart';
import 'custom_bottom_nav.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _selectedIndex = 1;

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
      appBar: AppBar(title: Text("Service")),
      body: Center(child: Text("This is the Service screen.")),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
