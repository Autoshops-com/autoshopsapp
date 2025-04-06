import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_screen.dart';
import 'service_screen.dart';
import 'map_screen.dart';
import 'profile_screen.dart';
import 'car_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AutoShops App',
      theme: ThemeData(primarySwatch: Colors.red,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/car': (context) => CarScreen(),
        '/service': (context) => ServiceScreen(),
        '/map': (context) => MapScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
