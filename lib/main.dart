// main.dart
import 'package:flutter/material.dart';
//import 'package:shiplee/screens/payment_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ShipmentApp());
}

class ShipmentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shipment Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}