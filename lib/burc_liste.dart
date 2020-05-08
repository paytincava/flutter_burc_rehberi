import 'package:flutter/material.dart';
import 'package:flutterburcrehberi/burc_detay.dart';

import 'models/burc.dart';
import 'utils/strings.dart';

class BurcListesi extends StatelessWidget {
  //list icerigi string int gibi Burc tipinde olacak ve verikaynagihazirla methodu dolduracak listeyi
  // static List ler sinifa ozgu , statik olmayanlar ise nesneye ozgudur.
 static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text('Burc Rehberi'),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    // bu method geriye bir liste donduruyor ve tumburc listesinin icini dolduruyor.
//buna tekrar bak
    List<Burc> burclarSource = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() +
          '${i + 1}.jpg'; // koc1.jpg anlamina gelir.
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk${i + 1}.jpg';

      Burc eklenecekBurc = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          kucukResim,
          buyukResim);

      burclarSource.add(eklenecekBurc);
    }

    return burclarSource;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          //onTap: ()=> Navigator.pushNamed(context, 'burcdetay') ,
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>BurcDetay(index))),
          leading: Image.asset(
            'assets/images/' + oanListeyeEklenenBurc.burcKucukResim,
            width: 64,
            height: 64,
          ), //burcun kucuk resim gelecegi yer
          title: Text(
            oanListeyeEklenenBurc.burcAdi + 'burcu',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade500),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(oanListeyeEklenenBurc.burcTarihi),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
