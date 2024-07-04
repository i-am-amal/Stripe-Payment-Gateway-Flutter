import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment_gateway/config/api_keys.dart';
import 'package:stripe_payment_gateway/screens/stripe_payment_screen.dart';

void main() {
  Stripe.publishableKey = publishablekey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StripePaymentGatewayScreen());
  }
}
