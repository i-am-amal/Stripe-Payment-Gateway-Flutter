import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stripe_payment_gateway/config/api_keys.dart';

createPaymentIntent() async {
  try {
    Map<String, dynamic> body = {
      'amount': '1000',
      'currency': 'USD',
    };

    final response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
        headers: {
          "Authorization": "Bearer $secretKey",
          "Content-Type": "application/x-www-form-urlencoded"
        });
    return json.decode(response.body);
  } catch (e) {
    throw Exception(e.toString());
  }
}
