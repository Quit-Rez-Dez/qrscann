import 'package:flutter/material.dart';

import 'package:qrscann/widgets/scan_tiles.dart';

class DireccionesPages extends StatelessWidget {
  const DireccionesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScanTile(tipo: 'http');

  }
}
