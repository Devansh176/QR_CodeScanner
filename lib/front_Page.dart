import 'package:flutter/material.dart';
import 'package:qr_Scanner/Scan_Qr.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final height = screenSize.height;
    final width = screenSize.width;
    
    final double padding = width * 0.05;
    final double fontSize = width * 0.05;

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SizedBox(height: padding * 4.0,),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const scan_QR()
                ),
              );
              ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                side: WidgetStateProperty.all(const BorderSide(color: Colors.lightGreen),),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(padding * 5),
                  )
                )
              );
            },
            child: Text(
              'Scan Qr',
              style: TextStyle(
                fontSize: fontSize * 0.3,
              ),
            ),
          ),
        ],
      )
    );
  }
}
