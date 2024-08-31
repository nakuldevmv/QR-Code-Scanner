import 'package:flutter/material.dart';

class qr_code_scanner extends StatelessWidget {
  const qr_code_scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("QR Code Scanner"),
          elevation: 0,
        ),
        body: Column(
          children: [
            const Text("Place the QR code below"),
            Container(
              height: 300,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
