import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment_gateway/services/api_service.dart';

class StripePaymentGatewayScreen extends StatefulWidget {
  const StripePaymentGatewayScreen({super.key});

  @override
  State<StripePaymentGatewayScreen> createState() =>
      _StripePaymentGatewayState();
}

class _StripePaymentGatewayState extends State<StripePaymentGatewayScreen> {
  Map<String, dynamic>? paymentIntent;

  void makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "US", currencyCode: "USD", testEnv: true);
      Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!["client_secret"],
              style: ThemeMode.dark,
              merchantDisplayName: 'AMAL',
              googlePay: gpay));
      displayPaymentSheet();
    } catch (e) {
      debugPrint('error occured');
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      debugPrint('Payment Done');
    } catch (e) {
      debugPrint('Payment Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment Gateway'),
      ),
      body: Column(
        children: [
          const Text('Welcome to Stripe Payment Gateway'),
          TextFormField(),
          ElevatedButton.icon(
              onPressed: () {
                makePayment();
              },
              label: const Text('Proceed to payment'))
        ],
      ),
    );
  }
}
