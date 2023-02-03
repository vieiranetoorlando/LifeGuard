import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:proj_lifeguard/pages/pag2.dart';
import 'package:proj_lifeguard/pages/pag3.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _SelectedIndex = 0;

  void _NavigateBottomBar(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    pag2(),
    pag3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_SelectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: GNav(
          selectedIndex: _SelectedIndex,
          onTabChange: _NavigateBottomBar,
          iconSize: 30,
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: Color.fromARGB(181, 81, 76, 76), // unselected icon color
          activeColor:
              Color.fromARGB(255, 0, 0, 0), // selected icon and text color
          backgroundColor: Color.fromARGB(255, 241, 159, 17),
          tabBackgroundColor:
              Color.fromARGB(255, 255, 196, 77).withOpacity(0.5),
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.description,
              text: 'Dados',
            ),
            //        GButton(
            //         icon: Icons.ac_unit,
            //         text: 'Outros',
            //       ),
          ],
        ),
      ),
    );
  }
}
