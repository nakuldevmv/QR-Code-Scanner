import 'package:flutter/material.dart';

import 'qr_codeS.dart/qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const qrscanner();
  }
}
