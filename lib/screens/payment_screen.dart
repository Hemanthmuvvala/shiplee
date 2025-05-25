// screens/payment_screen.dart
import 'package:flutter/material.dart';
import '../models/shipment.dart';
import '../services/payment_service.dart';
import 'confirmation_screen.dart';

class PaymentScreen extends StatefulWidget {
  final Shipment shipment;
  
  const PaymentScreen({super.key, required this.shipment});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvv = '';
  String _cardHolderName = '';
  bool _isProcessing = false;
  
  final PaymentService _paymentService = PaymentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: _isProcessing
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Order Summary
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Order Summary',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildSummaryRow('Courier', widget.shipment.courier ?? ''),
                            _buildSummaryRow('From', '${widget.shipment.pickupCity}'),
                            _buildSummaryRow('To', '${widget.shipment.deliveryCity}'),
                            _buildSummaryRow('Weight', '${widget.shipment.weight} kg'),
                            const Divider(),
                            _buildSummaryRow(
                              'Total Amount',
                              '₹${widget.shipment.price.toStringAsFixed(2)}',
                              isTotal: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Payment Form
                    const Text(
                      'Payment Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _buildTextField(
                      label: 'Card Holder Name',
                      onChanged: (value) => _cardHolderName = value,
                    ),
                    
                    _buildTextField(
                      label: 'Card Number',
                      onChanged: (value) => _cardNumber = value,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                    ),
                    
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            label: 'Expiry Date (MM/YY)',
                            onChanged: (value) => _expiryDate = value,
                            maxLength: 5,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildTextField(
                            label: 'CVV',
                            onChanged: (value) => _cvv = value,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: _processPayment,
                      child: Text('Pay ₹${widget.shipment.price.toStringAsFixed(2)}'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Theme.of(context).primaryColor : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          counterText: '',
        ),
        keyboardType: keyboardType,
        maxLength: maxLength,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }

  Future<void> _processPayment() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });
      
      try {
        // Process payment through service
        final success = await _paymentService.processPayment(
          amount: widget.shipment.price,
          cardNumber: _cardNumber,
          expiryDate: _expiryDate,
          cvv: _cvv,
          cardHolderName: _cardHolderName,
        );
        
        if (success) {
          // Generate tracking number
          final trackingNumber = 'TRK${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';
          widget.shipment.trackingNumber = trackingNumber;
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmationScreen(shipment: widget.shipment),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment failed. Please try again.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing payment: $e')),
        );
      } finally {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }
}