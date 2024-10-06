import 'package:flutter/material.dart';
import 'package:qr_Scanner/Scan_Qr.dart';
import 'package:qr_Scanner/front_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
    );
  }
}