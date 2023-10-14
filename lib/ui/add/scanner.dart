import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_market_app/ui/add/add_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../cubits/adding_cubit/adding_cubit.dart';

class ScanProduct extends StatefulWidget {
  const ScanProduct({super.key});

  @override
  State<ScanProduct> createState() => _ScanProductState();
}

class _ScanProductState extends State<ScanProduct> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skanerlang'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (QRViewController controller) {
                this.controller = controller;
                controller.toggleFlash();
                controller.scannedDataStream.listen((scanData) async {
                  if (scanData.code != null) {
                    controller.toggleFlash();
                    await controller.stopCamera();
                    if(context.mounted){
                      context.read<AddingCubit>().scanProduct(scanData.code!);
                      debugPrint("Added product qr code: ${scanData.code}");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddScreen()));
                    }
                  }
                  // Scan successful, update ProductCubit and pop the Navigator
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
