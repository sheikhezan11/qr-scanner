import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sm_trader_scanner/utils/images.dart';
import 'package:sm_trader_scanner/view/scanner_screen.dart';

import '../controller/Scannercontroller.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScannerController _controller = Get.put(ScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF195A94),
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Text("SM Scanner", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20, color: Colors.white))),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(DummyImg.logo),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScannerScreen(),));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Scan QR / Bar Code',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white  , backgroundColor: Color(0xFF195A94),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24,),
            ElevatedButton(
              onPressed: _controller.scanBarcode,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Generate QR-Code',
                  style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white  , backgroundColor: Color(0xFF195A94),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF195A94),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() => Text(
                _controller.scannedResult.value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ,color: Colors.white),
                textAlign: TextAlign.center,
              )),
            ),
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.center,
            //     child: Icon(
            //       Icons.qr_code_sharp,
            //       size: 200,
            //       color: Color(0xFF195A94),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
