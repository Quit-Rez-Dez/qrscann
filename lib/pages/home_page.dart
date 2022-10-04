import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscann/pages/direcciones_pages.dart';
import 'package:qrscann/pages/mapas_pages.dart';
import 'package:qrscann/providers/Scan_list_provider.dart';
import 'package:qrscann/providers/db_provide.dart';
import 'package:qrscann/providers/ui_provider.dart';

import 'package:qrscann/widgets/custom_navigatorbar.dart';
import 'package:qrscann/widgets/scan_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
              onPressed: (){
                final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);

                scanListProvider.borrarTodos();
              },
              icon: Icon(Icons.delete_forever))
        ],
      ),
     body:  _HomePageBody(),
      bottomNavigationBar:const CustonNavigatioBar() ,
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    //Obtener el selected menu opt
    final uiProvider=Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentindex=uiProvider.selectedMenuOpt;

    //TODO TEmporal leer la base de datos


    /*final tempScan = new ScanModel(valor: 'http//google.com');
    DBProvider.db.deletAllScans().then(print);*/

    final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);


    switch(currentindex){
      case 0:
        scanListProvider.caregarScansPorTipo('geo');
        return MapasPages();
      case 1:
        scanListProvider.caregarScansPorTipo('http');
        return DireccionesPages();
      default:
        return MapasPages();

    }

  }



}

