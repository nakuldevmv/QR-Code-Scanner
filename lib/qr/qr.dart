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
          backgroundColor: const Color.fromARGB(255, 29, 13, 34),
          title: const Text(
              style: TextStyle(color: Colors.white), "QR Code Scanner"),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 29, 13, 34),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 131, 124, 136),
                  Color.fromARGB(255, 29, 13, 34)
                ],
                stops: [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text(
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      "Position QR Code Below"),
                  Text(
                      style: TextStyle(
                          fontSize: 17,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                      "Align the scanner for auto QR scan."),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.white,
                    //   width: 2,
                    // ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
                      Positioned(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        bottom: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: (result != null)
                    ? Text("QR Data : ${result!.code}")
                    : const Text(
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        "Scan a code"),
              ),
              Container(
                // child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color.fromARGB(176, 131, 194, 242),
                //       shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(100),
                //           topRight: Radius.circular(100),
                //           bottomLeft: Radius.circular(60),
                //           bottomRight: Radius.circular(60),
                //         ),
                //       ),
                //       elevation: 10,
                //       shadowColor: const Color.fromARGB(255, 0, 0, 0),
                //       // minimumSize: const Size(60, 60),
                //       // padding:
                //       //     const EdgeInsets.fromLTRB(0, 0, 20, 0), // padding
                //     ),
                //     onPressed: () {},
                //     child: const Text("Open In Bowser")),
                child: (result != null &&
                        (Uri.parse(result!.code.toString())
                                .scheme
                                .startsWith('http') ||
                            Uri.parse(result!.code.toString())
                                .scheme
                                .startsWith('www')))
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(121, 131, 194, 242),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                          elevation: 10,
                          shadowColor: const Color.fromARGB(255, 0, 0, 0),
                          // minimumSize: const Size(60, 60),
                          // padding:
                          //     const EdgeInsets.fromLTRB(0, 0, 20, 0), // padding
                        ),
                        onPressed: () => result != null
                            ? _urlLaunch(result!.code.toString())
                            : null,
                        child: const Text(
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            "Open In Browser"))
                    : Container(),
              )
            ],
          ),
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
