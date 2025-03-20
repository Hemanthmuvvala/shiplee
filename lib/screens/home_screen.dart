
import 'package:flutter/material.dart';
import 'package:shiplee/screens/book_shipment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Shipment App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text(
              'Welcome to Shipment Booking',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
         const    SizedBox(height: 20),
            ElevatedButton(
              child:const  Text('Book a Shipment'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookShipmentScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}