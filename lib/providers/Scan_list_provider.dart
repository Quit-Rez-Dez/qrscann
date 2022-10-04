import 'package:flutter/material.dart';
import 'package:qrscann/providers/db_provide.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans=[];
  String tipoSeleccionado='http';

  Future<ScanModel> nuevoScan(String valor) async{

    final nuevoScan = new ScanModel(valor: valor);

    final id=await DBProvider.db.nuevoScan(nuevoScan);
    ///ASignar el id de la base de datos al modelo

    nuevoScan.id =id;


    if(this.tipoSeleccionado== nuevoScan.tipo)
      {
        this.scans.add(nuevoScan);
        notifyListeners();
      }

    return nuevoScan;
  }


  cargarScans(  ) async{
    final scans =await DBProvider.db.getTodosScans();
    this.scans =[...?scans];
    notifyListeners();

  }

  caregarScansPorTipo( String tipo ) async{
    final scans =await DBProvider.db.getScansPorTipo(tipo);
    this.scans =[...?scans];
    this.tipoSeleccionado=tipo;
    notifyListeners();
  }

  borrarTodos() async{
    await DBProvider.db.deletAllScans();
    this.scans=[];
    notifyListeners();
  }

  borrarScanPorId( int? id ) async{

    //scans.removeWhere((scan) => scan.id ==id);
    await DBProvider.db.deleteScans(id!);
    ///YA tiene notifierlistener
    caregarScansPorTipo(this.tipoSeleccionado);
  }

}