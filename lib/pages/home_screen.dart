import 'package:SafeShopper/pages/buyer_screen.dart';
import 'package:SafeShopper/pages/settings_screen.dart';
import 'package:SafeShopper/utils/animate_child.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<String> _title = [
    'Home',
    'Settings',
  ];

  List<Widget> _page = [
    BuyerPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_currentIndex]),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex != index) {
            _currentIndex = index;
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
      // body: AnimatedCrossFade(
      //   duration: Duration(milliseconds: 500),
      //   firstChild: _page[0],
      //   secondChild: _page[1],
      //   crossFadeState: _currentIndex == 0
      //       ? CrossFadeState.showFirst
      //       : CrossFadeState.showSecond,
      // ),
      body: AnimateChild(child: _page[_currentIndex]),
    );
  }
}
