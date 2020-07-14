import 'package:flutter/material.dart';
import 'package:neobank/screens/contact_form.dart';

void main() {
  runApp(NeoBank());
}

class NeoBank extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactForm(),
    );
  }
}

