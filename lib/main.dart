import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/burc_detay.dart';
import 'package:flutterburcrehberi/burc_liste.dart';
// uygulama ilk acildiginda main methodunu arar
void main() => runApp(MyApp());       // runapp bizden uygulamayi baslatacak ilk widgeti bekliyor

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // genellikle uygulama ilk kok widget olan materialapp ile basliyor. uyg routelari pathler material icinde yazilir
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink,),
      title: 'Burc Rehberi Uygulamasi',

      initialRoute: '/burcListesi',

      routes: {
        '/' : (context)=> BurcListesi(),
        '/burcListesi' : (context)=> BurcListesi(),

      } ,

     /* onGenerateRoute: (RouteSettings settings) {

        List<String> pathElemanlari = settings.name.split('/');   //   burcDetay/1

        if (pathElemanlari[1] == 'burcDetay'){
          
          return MaterialPageRoute(builder: (context)=>BurcDetay(int.parse(pathElemanlari[2])));
        }

        return null;

      },   */

     // home: BurcListesi(),     // acilacak ilk sayfa eger route tanimlandiysa home iptal edilir
    );
  }


}