import 'package:flutter/material.dart';

import 'burc_liste.dart';
import 'models/burc.dart';

class BurcDetay extends StatelessWidget {

  int gelenIndex;

  Burc secilenBurc;

  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {

    secilenBurc = BurcListesi.tumBurclar[gelenIndex];

    return Scaffold(

      body: CustomScrollView(

        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(secilenBurc.burcAdi + 'Burcu'),
              background: Image.asset('assets/images/' + secilenBurc.burcBuyukResim , fit: BoxFit.cover,),
              centerTitle: true,
            ),

          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              //color: Colors.deepOrangeAccent.shade100,  decoration daki color ile conrtainer color cakisiyor.
              child: SingleChildScrollView(
                child: Text(secilenBurc.burcDetayi, style: TextStyle(color: Colors.black54, fontSize: 18),),
              ),
            ),
          )
        ],

      ),

    );
  }


}
