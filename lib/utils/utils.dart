import 'package:flutter/material.dart';
import 'package:qrscann/providers/db_provide.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL ( BuildContext context ,  ScanModel scan ) async{

  final Uri _url = Uri.parse(scan.valor);


  if(scan.tipo=='http')
    {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }

    }else
      {
        Navigator.pushNamed(context, 'mapa',arguments: scan);
      }




}


