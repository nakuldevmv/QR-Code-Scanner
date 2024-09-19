import 'package:flutter/material.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class xs extends StatefulWidget {
  const xs({super.key});

  @override
  State<xs> createState() => _xsState();
}

class _xsState extends State<xs> {
  // final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  String? result;
  // QRViewController? controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text(style: TextStyle(color: Colors.white), "QR Code Scanner"),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Stack(
            children: [
              //////
              // QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),

              QRCodeDartScanView(
                scanInvertedQRCode: true, // enable scan invert qr code ( default = false)

                typeScan: TypeScan.live, // if TypeScan.takePicture will try decode when click to take a picture(default TypeScan.live)
                // intervalScan: const Duration(seconds:1)
                // onResultInterceptor: (old,new){
                //  do any rule to controll onCapture.
                // }
                // takePictureButtonBuilder: (context,controller,isLoading){ // if typeScan == TypeScan.takePicture you can customize the button.
                //    if(loading) return CircularProgressIndicator();
                //    return ElevatedButton(
                //       onPressed:controller.takePictureAndDecode,
                //       child:Text('Take a picture'),
                //    );
                // }
                // resolutionPreset: = QrCodeDartScanResolutionPreset.high,
                // formats: [ // You can restrict specific formats.
                //  BarcodeFormat.qrCode,
                //  BarcodeFormat.aztec,
                //  BarcodeFormat.dataMatrix,
                //  BarcodeFormat.pdf417,
                //  BarcodeFormat.code39,
                //  BarcodeFormat.code93,
                //  BarcodeFormat.code128,
                //  BarcodeFormat.ean8,
                //  BarcodeFormat.ean13,
                // ],
                onCapture: (Result result) {
                  setState(() {
                    this.result = result.text;
                  });
                },
              ),

              //////
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                ),
                                border: Border(
                                  top: BorderSide(color: Colors.white, width: 5),
                                  left: BorderSide(color: Colors.white, width: 5),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                border: Border(
                                  top: BorderSide(color: Colors.white, width: 5),
                                  right: BorderSide(color: Colors.white, width: 5),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                ),
                                border: Border(
                                  bottom: BorderSide(color: Colors.white, width: 5),
                                  left: BorderSide(color: Colors.white, width: 5),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                ),
                                border: Border(
                                  bottom: BorderSide(color: Colors.white, width: 5),
                                  right: BorderSide(color: Colors.white, width: 5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: (result != null)
                        ? Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(color: Color.fromARGB(113, 0, 0, 0), borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: SelectableText(
                                style: const TextStyle(color: Colors.white),
                                " ${result!}",
                              ),
                            ))
                        : const Text(style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white), "Scan a code"),
                  ),
                  Container(
                    child: (result != null && (Uri.parse(result!).scheme.startsWith('http') || Uri.parse(result!).scheme.startsWith('www')))
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(156, 0, 0, 0),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)
                                    // topLeft: Radius.circular(100),
                                    // topRight: Radius.circular(100),
                                    // bottomLeft: Radius.circular(60),
                                    // bottomRight: Radius.circular(60),
                                    ),
                              ),
                              elevation: 10,
                              shadowColor: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            onPressed: () => result != null ? _urlLaunch(result!) : null,
                            child: const Text(style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), "Open In Browser"))
                        : Container(),
//
//
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData;
  //     });
  //   });
  // }

  _urlLaunch(String string) async {
    await launchUrl(Uri.parse(string));
  }
}
