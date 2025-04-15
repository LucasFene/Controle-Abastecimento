import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(CombustivelApp());
}

class CombustivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Combustível',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}
