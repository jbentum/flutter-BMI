import 'package:flutter/material.dart';
import './ui/home.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "BMI App",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
