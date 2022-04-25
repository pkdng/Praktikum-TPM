import 'package:flutter/material.dart';
import 'package:modul_7/page_detail_countries.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageDetailCountries(),
    );
  }
}