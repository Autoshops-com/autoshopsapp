import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBD2 Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Dashboard'),
      ),
      body: SingleChildScrollView(
        // Wrap in SingleChildScrollView
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 250, // Set a fixed height to avoid overflow issues
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 220,
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0, endValue: 80, color: Colors.green),
                      GaugeRange(
                          startValue: 80, endValue: 150, color: Colors.orange),
                      GaugeRange(
                          startValue: 150, endValue: 220, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(value: 80), // Example speed
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          '80 km/h',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        positionFactor: 0.5,
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VehicleStatCard(title: "RPM", value: "3200"),
                VehicleStatCard(title: "Coolant Temp", value: "90°C"),
                VehicleStatCard(title: "Fuel Efficiency", value: "12 km/L"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Find a Mechanic"),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleStatCard extends StatelessWidget {
  final String title;
  final String value;

  VehicleStatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
