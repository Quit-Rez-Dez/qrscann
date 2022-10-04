import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscann/pages/home_page.dart';
import 'package:qrscann/pages/mapa_page.dart';
import 'package:qrscann/providers/Scan_list_provider.dart';
import 'package:qrscann/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR REader',
        initialRoute: 'home',
        routes: {
          'home':(_) => const HomePage(),
          'mapa':(_) => const MapaPage(),
        },
        theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(primary: Colors.deepPurple,),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              foregroundColor: Colors.white,
            backgroundColor: Colors.deepPurple
          )
        ),
      ),
    );
  }
}
