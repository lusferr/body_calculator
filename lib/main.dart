import 'package:flutter/material.dart';
import 'package:flutter_body_calculation/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Body Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    ),
  );
}
