import 'package:flutter/material.dart';
import 'package:visual1/src/views/fullscreenmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matirial App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: FullScreenMap(),
          ),
        ),
      ),
    );
  }
}