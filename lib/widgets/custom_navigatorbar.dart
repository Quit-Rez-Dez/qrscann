import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscann/providers/ui_provider.dart';

class CustonNavigatioBar extends StatelessWidget {
  const CustonNavigatioBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final uiProvider=Provider.of<UiProvider>(context);

    final currentIndex=uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt=i,
      currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'Direcciones',
          )
        ]
    );
  }
}