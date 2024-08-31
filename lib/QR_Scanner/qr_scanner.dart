import 'package:flutter/material.dart';

const bgcolor = Color(0xFFFFC107);

class qr_scanner extends StatelessWidget {
  const qr_scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("QR CODE SCANNER"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                color: const Color(0xFFFFC107),
                child: const Text("place the QR Code below to scan"),
              )),
              Expanded(
                  child: Container(
                color: const Color.fromARGB(255, 193, 171, 104),
              )),
              Expanded(
                  child: Container(
                color: const Color.fromARGB(255, 119, 119, 119),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
