import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/address_page.dart';
import 'package:qr_scanner/src/pages/maps_page.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar:  _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.filter_center_focus),
          onPressed: _scanQR,
          backgroundColor: Theme.of(context).primaryColor,
    ),
    );
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            title: Text('Direcciones')
        )
      ],
    );

  }

  Widget _callPage(int pageCurrent) {
    switch(pageCurrent){
      case 0: return Maps_page();
      case 1: return AddressPage();

      default:
        return Maps_page();
    }

  }

  _scanQR() async {

    String futureString = 'https://facebook.com';

 /*   try{
      futureString = await new QRCodeReader().scan();
    }catch(e){
      futureString = e.toString();
    }
    
    print('future: $futureString');
  */
    if (futureString != null){
      final scan = ScanModel(value: futureString);
      DBProvider.db.newScan(scan);
    }

  }
}
