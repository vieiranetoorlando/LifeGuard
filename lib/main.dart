import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:proj_lifeguard/pages/homepage.dart';
import 'package:proj_lifeguard/pages/login.dart';
import 'package:proj_lifeguard/pages/pag2.dart';
import 'package:proj_lifeguard/pages/pag3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        'homepage': (context) => homepage(),
        'page2': (context) => pag2(),
        'pae3': (context) => pag3(),
      },
    );
  }
}
