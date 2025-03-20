// models/shipment.dart
class Shipment {
  String? pickupName;
  String? pickupAddressLine1;
  String? pickupAddressLine2;
  String? pickupCity;
  String? pickupPostalCode;
  
  String? deliveryName;
  String? deliveryAddressLine1;
  String? deliveryAddressLine2;
  String? deliveryCity;
  String? deliveryPostalCode;
  
  double? weight;
  String? courier;
  double price = 0.0;
  String? trackingNumber;
  
  Shipment({
    this.pickupName,
    this.pickupAddressLine1,
    this.pickupAddressLine2,
    this.pickupCity,
    this.pickupPostalCode,
    this.deliveryName,
    this.deliveryAddressLine1,
    this.deliveryAddressLine2,
    this.deliveryCity,
    this.deliveryPostalCode,
    this.weight,
    this.courier,
    this.price = 0.0,
    this.trackingNumber,
  });
}