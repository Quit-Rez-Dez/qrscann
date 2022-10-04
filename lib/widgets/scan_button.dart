import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscann/providers/Scan_list_provider.dart';
import 'package:qrscann/utils/utils.dart';
class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
        onPressed: () async {

          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF',
              'Cancelar',
              false,
              ScanMode.QR);

          //final barcodeScanRes ='https://pub.dev/packages/url_launcher';
          //final barcodeScanRes ='geo:20.623149,-100.380012';

          if(barcodeScanRes =='-1')
            {
              return;
            }

          final scaListProvider = Provider.of<ScanListProvider>(context,listen:false);

          final nuevoScan= await scaListProvider.nuevoScan(barcodeScanRes);


          launchURL(context, nuevoScan);

          print(barcodeScanRes);


        });
  }
}
