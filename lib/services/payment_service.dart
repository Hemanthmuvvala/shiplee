
class PaymentService {
  Future<bool> processPayment({
    required double amount,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
    required String cardHolderName,
  }) async {
   
    await Future.delayed(const Duration(seconds: 2));
    
    
    if (cardNumber.length != 16 || cvv.length != 3) {
      return false;
    }
    
    
    return true;
  }
}