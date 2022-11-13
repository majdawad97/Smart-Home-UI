import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus]
    ['Smart Light', 'icons/light-bulb.png', true],
    ['Smart AC', 'icons/air-conditioner.png', false],
    ['Smart TV', 'icons/smart-tv.png', false],
    ['Smart Fan', 'icons/fan.png', false],
  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'icons/more.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'MAJD AWAD',
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const SizedBox(height: 5),

            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey[800],
                ),
              ),
            ),

            Expanded(
                child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(25),
              itemCount: mySmartDevices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: mySmartDevices[index][0],
                  iconPath: mySmartDevices[index][1],
                  powerOn: mySmartDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
