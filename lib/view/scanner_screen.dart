import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

const bgColor = Colors.white;

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "QR Scanner",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Place The Qr Code in the Area",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    Text(
                      "Scanning will start automatically",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: MobileScanner(onDetect: (BarcodeCapture barcodes) {  },),
            ),
            Expanded(
              child: Container(
                child: Text(
                  "Developed By Ezan",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                      )),
                ), // Adjust the height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
