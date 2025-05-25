// screens/book_shipment_screen.dart
import 'package:flutter/material.dart';
import '../models/shipment.dart';
import '../services/courier_service.dart';
import 'payment_screen.dart';

class BookShipmentScreen extends StatefulWidget {
  const BookShipmentScreen({super.key});

  @override
  _BookShipmentScreenState createState() => _BookShipmentScreenState();
}

class _BookShipmentScreenState extends State<BookShipmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _shipment = Shipment();
  bool _isLoading = false;
  double _estimatedPrice = 0.0;
  String _selectedCourier = 'Delhivery';
  final List<String> _courierOptions = ['Delhivery', 'DTDC', 'Bluedart', 'FedEx', 'DHL'];
  
  final CourierService _courierService = CourierService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Shipment'),
      ),
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Pickup Address Section
                    _buildSectionTitle('Pickup Details'),
                    _buildTextFormField(
                      label: 'Name',
                      onSaved: (value) => _shipment.pickupName = value,
                    ),
                    _buildTextFormField(
                      label: 'Address Line 1',
                      onSaved: (value) => _shipment.pickupAddressLine1 = value,
                    ),
                    _buildTextFormField(
                      label: 'Address Line 2',
                      onSaved: (value) => _shipment.pickupAddressLine2 = value,
                      isRequired: false,
                    ),
                    _buildTextFormField(
                      label: 'City',
                      onSaved: (value) => _shipment.pickupCity = value,
                    ),
                    _buildTextFormField(
                      label: 'Postal Code',
                      onSaved: (value) => _shipment.pickupPostalCode = value,
                      keyboardType: TextInputType.number,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Delivery Address Section
                    _buildSectionTitle('Delivery Details'),
                    _buildTextFormField(
                      label: 'Name',
                      onSaved: (value) => _shipment.deliveryName = value,
                    ),
                    _buildTextFormField(
                      label: 'Address Line 1',
                      onSaved: (value) => _shipment.deliveryAddressLine1 = value,
                    ),
                    _buildTextFormField(
                      label: 'Address Line 2',
                      onSaved: (value) => _shipment.deliveryAddressLine2 = value,
                      isRequired: false,
                    ),
                    _buildTextFormField(
                      label: 'City',
                      onSaved: (value) => _shipment.deliveryCity = value,
                    ),
                    _buildTextFormField(
                      label: 'Postal Code',
                      onSaved: (value) => _shipment.deliveryPostalCode = value,
                      keyboardType: TextInputType.number,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Package Details
                    _buildSectionTitle('Package Details'),
                    _buildTextFormField(
                      label: 'Weight (kg)',
                      onSaved: (value) => _shipment.weight = double.parse(value ?? '0'),
                      keyboardType: TextInputType.number,
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Courier Selection
                    _buildSectionTitle('Select Courier'),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      value: _selectedCourier,
                      items: _courierOptions.map((String courier) {
                        return DropdownMenuItem<String>(
                          value: courier,
                          child: Text(courier),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCourier = value!;
                          _calculateEstimatedPrice();
                        });
                      },
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Price Calculation
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Estimated Price',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '₹${_estimatedPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Calculate Button
                    ElevatedButton(
                      child: const Text('Calculate Price'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _calculateEstimatedPrice();
                        }
                      },
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Proceed to Payment Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: _estimatedPrice > 0
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _shipment.price = _estimatedPrice;
                                _shipment.courier = _selectedCourier;
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentScreen(shipment: _shipment),
                                  ),
                                );
                              }
                            }
                          : null,
                      child: const Text('Proceed to Payment'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required Function(String?) onSaved,
    bool isRequired = true,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        keyboardType: keyboardType,
        validator: isRequired
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              }
            : null,
        onSaved: onSaved,
      ),
    );
  }

  Future<void> _calculateEstimatedPrice() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      // Get price from API service
      final price = await _courierService.getShippingRate(
        pickupPostalCode: _shipment.pickupPostalCode ?? '',
        deliveryPostalCode: _shipment.deliveryPostalCode ?? '',
        weight: _shipment.weight ?? 0,
        courier: _selectedCourier,
      );
      
      setState(() {
        _estimatedPrice = price;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error calculating price: $e')),
      );
    }
  }
}