
import 'package:flutter/material.dart';
import 'package:shiplee/practice/listviewbuilder.dart';
// import 'package:shiplee/practice/mailhomescreen.dart';




void main() {
  runApp(const ShipmentApp());
}

class ShipmentApp extends StatelessWidget {
   const ShipmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shipment Booking App',
      debugShowCheckedModeBanner:false,
      home:   Listviewbuilder(),
    );
  }
}