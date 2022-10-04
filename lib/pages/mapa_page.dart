import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qrscann/providers/db_provide.dart';



class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {


  Completer<GoogleMapController> _controller = Completer();

  MapType mapType =MapType.normal;



  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

     final  CameraPosition puntoinicial = CameraPosition(
      target: scan.getLatlng(),
      zoom: 17.5,
       tilt: 50
    );

     //MARCADores

    Set<Marker> marker = new Set<Marker>();

    marker.add(Marker(
        markerId: MarkerId('geo-location'),
      position: scan.getLatlng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async{
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: scan.getLatlng(),
                          zoom: 17.5,
                          tilt: 50)
                    )
                );


              },
              icon: Icon(Icons.location_history))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: marker,
        myLocationButtonEnabled: false,
        initialCameraPosition: puntoinicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.layers),
        onPressed: (){
          if (mapType==MapType.normal) {
            mapType=MapType.satellite;
          }  else
            {
              mapType=MapType.normal;
            }

          setState(() {});

        },
      ),
    );
  }
}
