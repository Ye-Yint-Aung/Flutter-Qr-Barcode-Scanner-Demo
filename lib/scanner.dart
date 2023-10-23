import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _scanBarcode = "";
  Future<void> scanCoder() async {
    String scanResult;
    scanResult = await FlutterBarcodeScanner.scanBarcode("#42f5ee", "cancel", true, ScanMode.QR);
    print("I am Scanning result : $scanResult");
    setState(() {
      _scanBarcode = scanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Scanner Testing")),
      body: Center(
        child: Column(
          children: [
            Text(_scanBarcode),
            QrImageView(
              data: "Qr Code",
              version: QrVersions.auto,
              size: 200,
              backgroundColor: Colors.black,
              // ignore: deprecated_member_use
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanCoder,
        tooltip: "Increment",
        child: const Icon(Icons.scanner),
      ),
    );
  }
}
