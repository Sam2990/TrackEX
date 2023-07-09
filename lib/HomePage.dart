import 'package:flutter/material.dart';
import 'home.dart';
import 'stats.dart';
import 'newdata.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    RealtimeLineGraph(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: _currentIndex==0?Color(0xfff56300):Colors.grey,),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph,color: _currentIndex==1?Color(0xfff56300):Colors.grey,),
            label: 'Statistics',
          ),
        ],
        selectedItemColor: Color(0xffe65100),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffe65100),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Newdata()));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
