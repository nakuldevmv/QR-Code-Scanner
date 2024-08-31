import 'package:flutter/material.dart';

import 'QR_Scanner/qr_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const qr_scanner();
  }
}
