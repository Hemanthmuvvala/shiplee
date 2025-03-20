
class CourierService {
  
  final String baseUrl = 'https://mockapiurl.com/api';

  Future<double> getShippingRate({
    required String pickupPostalCode,
    required String deliveryPostalCode,
    required double weight,
    required String courier,
  }) async {
    
    
    await Future.delayed(Duration(seconds: 1));
    
   
    double baseRate = 100.0;  
    
   
    int pickupCode = int.tryParse(pickupPostalCode) ?? 110001;
    int deliveryCode = int.tryParse(deliveryPostalCode) ?? 110001;
    double distanceFactor = (pickupCode - deliveryCode).abs() / 10000;
    
    
    double weightFactor = weight * 10;
    
    
    double courierFactor = 1.0;
    switch (courier) {
      case 'Delhivery':
        courierFactor = 1.0;
        break;
      case 'DTDC':
        courierFactor = 0.9;
        break;
      case 'Bluedart':
        courierFactor = 1.2;
        break;
      case 'FedEx':
        courierFactor = 1.5;
        break;
      case 'DHL':
        courierFactor = 1.7;
        break;
    }
    
  
    double finalPrice = (baseRate + (distanceFactor * 50) + weightFactor) * courierFactor;
    
   
    return double.parse(finalPrice.toStringAsFixed(2));
    
    // for real working model
    /*
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/shipping-rates'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'pickupPostalCode': pickupPostalCode,
          'deliveryPostalCode': deliveryPostalCode,
          'weight': weight,
          'courier': courier,
        }),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['price'] as double;
      } else {
        throw Exception('Failed to get shipping rate: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
    */
  }
}