import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'custom_bottom_nav.dart';

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  int _selectedIndex = 0;

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
      appBar: AppBar(title: Text("Car Info")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Car Health Gauge
            Container(
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showTicks: false,
                        showLabels: false,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        ranges: <GaugeRange>[
                          GaugeRange(
                              startValue: 0,
                              endValue: 30,
                              color: Colors.red,
                              startWidth: 0.2,
                              endWidth: 0.2,
                              sizeUnit: GaugeSizeUnit.factor),
                          GaugeRange(
                              startValue: 30,
                              endValue: 70,
                              color: Colors.orange,
                              startWidth: 0.2,
                              endWidth: 0.2,
                              sizeUnit: GaugeSizeUnit.factor),
                          GaugeRange(
                              startValue: 70,
                              endValue: 100,
                              color: Colors.green,
                              startWidth: 0.2,
                              endWidth: 0.2,
                              sizeUnit: GaugeSizeUnit.factor),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: 80),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Car Health',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/car.png', // Replace with your image
                          height: 90,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Dashboard Box
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE63926),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("67", style: _statStyle()),
                          Text("MPH", style: _labelStyle())
                        ],
                      ),
                      Column(
                        children: [
                          Text("67", style: _statStyle()),
                          Text("RPM", style: _labelStyle())
                        ],
                      ),
                      Column(
                        children: [
                          Text("32°F", style: _statStyle()),
                          Text("Engine Temp", style: _labelStyle())
                        ],
                      ),
                      Column(
                        children: [
                          Text("9V", style: _statStyle()),
                          Text("Battery", style: _labelStyle())
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "See more >",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20),

            // Button to more info
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE63926),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                // Navigate or show dialog
              },
              child: Text("See more car info", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  TextStyle _statStyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(fontSize: 12, color: Colors.white);
  }
}
