import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Profile_page.dart';
import 'package:flutter_app/pages/history_page.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/theme.dart';

class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPageState();
}

class _MainPageState extends State<MainPages> {
  int _selectIndex = 0;

  final _PageList = [
    HomePages(),
    HistoryPages(),
    ProfilePages(),
  ];

  onTappedItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PageList.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "INICIO"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded), label: "PERFIL"),
        ],
        currentIndex: _selectIndex,
        onTap: onTappedItem,
        unselectedItemColor: grey35Color,
      ),
    );
  }
}
