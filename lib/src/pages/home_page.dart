import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/address_page.dart';
import 'package:qr_scanner/src/pages/maps_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
          bottomNavigationBar:  _createBottomNavigationBar(),
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
          title: Text('Direcciones'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.map),
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
}
