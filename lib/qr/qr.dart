import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class qrscanner extends StatefulWidget {
  const qrscanner({super.key});

  @override
  State<qrscanner> createState() => _qrscannerState();
}

class _qrscannerState extends State<qrscanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Place the QR code below"),
            Container(
              height: 300,
              width: 300,
              color: Colors.black,
              child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
            ),
            Container(
              child: (result != null)
                  ? Text("QR Data : ${result!.code}")
                  : const Text("Scan a code"),
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("Open In Bowser")),
              // child: (result != null &&
              //         (Uri.parse(result!.code.toString())
              //                 .scheme
              //                 .startsWith('http') ||
              //             Uri.parse(result!.code.toString())
              //                 .scheme
              //                 .startsWith('www')))
              //     ? ElevatedButton(
              //         onPressed: () => result != null
              //             ? _urlLaunch(result!.code.toString())
              //             : null,
              //         child: const Text("open in browser"))
              //     : Container(),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  _urlLaunch(String string) async {
    await launchUrl(Uri.parse(string));
  }
}
