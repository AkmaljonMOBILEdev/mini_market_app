import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_market_app/ui/sell/sell_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../cubits/selling_cubit/selling_cubit.dart';

class ScanForSell extends StatefulWidget {
  const ScanForSell({super.key});

  @override
  State<ScanForSell> createState() => _ScanForSellState();
}

class _ScanForSellState extends State<ScanForSell> {
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
        title: Text('Skanerlang'),
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
                    debugPrint("Selling qr code: ${scanData.code}");
                      if(context.mounted){
                        context.read<SellingCubit>().productIsSold(scanData.code!);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SellScreen()));
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
