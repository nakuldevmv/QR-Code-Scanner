import 'package:flutter/material.dart';

import 'QR Code Scanner/qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const qr_code_scanner();
  }
}
