import 'package:flutter/material.dart';

import 'package:qrscann/widgets/scan_tiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapasPages extends StatelessWidget {
  const MapasPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScanTile(tipo: 'geo');

  }

}
