import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:url_launcher/url_launcher.dart';

class scan_QR extends StatefulWidget {
  const scan_QR({super.key});

  @override
  State<scan_QR> createState() => _scan_QRState();
}

class _scan_QRState extends State<scan_QR> {

  final GlobalKey qrkey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;
  File? _userImageFile;

  void _pick() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      setState(() {
        _userImageFile = File(pickedImage.path);
      });

      String? data = await QrCodeToolsPlugin.decodeFrom(pickedImage.path);
      if(data != null){
        setState(() {
          result = Barcode(data, BarcodeFormat.qrcode, []);
        });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No QR Code in this Image",),
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    final double fontSize = width * 0.05;
    final double padding = width * 0.05;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        toolbarHeight: height * 0.17,
        centerTitle: true,
        title: Text(
          '\n\n\nScan QR...',
          style: TextStyle(
            fontSize: fontSize * 1.7,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: padding * 4.0),),
              IconButton(
                onPressed: _pick,
                icon: const Icon(Icons.image_outlined),
              ),
              Container(
                width: width * 0.7,
                height: height * 0.35,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(padding * 3.5),
                ),
                child: QRView(
                  key: qrkey,
                  onQRViewCreated: _onQrViewCreated,
                ),
              ),
              SizedBox(height: height * 0.2,),
              (result != null) ? Text("Barcode Data : ${result!.code}",
                style: TextStyle(
                fontSize: fontSize * 1.0,
                fontWeight: FontWeight.bold,
                ),
              ) : const Text("",),
            ],
          ),
        ),
      ),
    );
  }
  void _onQrViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData){
      setState(() {
        result = scanData;
        _launchInBrowser(result!.code.toString());
      });
    });
  }
  void _launchInBrowser(String s) async {
    await launchUrl(Uri.parse(s));
  }
}
