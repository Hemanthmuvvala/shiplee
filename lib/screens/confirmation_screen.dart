// screens/confirmation_screen.dart
import 'package:flutter/material.dart';
import '../models/shipment.dart';
import 'home_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  final Shipment shipment;
  
  const ConfirmationScreen({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Booking Confirmed'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Success Icon
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  shape: BoxShape.circle,
                ),
                child:const  Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 70,
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Success Message
         const   Center(
              child: Text(
                'Shipment Booked Successfully!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
      const      SizedBox(height: 8),
            
            Center(
              child: Text(
                'Thank you for your booking',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            
       const     SizedBox(height: 32),
            
            // Tracking Information
            Container(
              padding:const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tracking Number',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                const  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shipment.trackingNumber ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, size: 20),
                        onPressed: () {
                          // Copy to clipboard functionality would go here
                          ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(content: Text('Tracking number copied to clipboard')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
           const SizedBox(height: 24),
            
            // Shipment Details
            Card(
              elevation: 2,
              child: Padding(
                padding:const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text(
                      'Shipment Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow(
                      icon: Icons.local_shipping,
                      title: 'Courier',
                      value: shipment.courier ?? '',
                    ),
                    const Divider(),
                    _buildDetailRow(
                      icon: Icons.location_on,
                      title: 'From',
                      value: '${shipment.pickupCity}, ${shipment.pickupPostalCode}',
                    ),
                    const Divider(),
                    _buildDetailRow(
                      icon: Icons.flag,
                      title: 'To',
                      value: '${shipment.deliveryCity}, ${shipment.deliveryPostalCode}',
                    ),
                    const Divider(),
                    _buildDetailRow(
                      icon: Icons.money,
                      title: 'Amount Paid',
                      value: '₹${shipment.price.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
            ),
            
          const  SizedBox(height: 32),
            
            // Back to Home Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Back to Home'),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}