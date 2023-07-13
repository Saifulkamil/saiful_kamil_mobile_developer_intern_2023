import 'package:flutter/material.dart';
import 'package:saiful_kamil_mobile_developer_intern_2023/firtPage.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: firtPage(),
      
    );
  }
}

