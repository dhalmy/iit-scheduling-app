import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/nav_bar.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return const MaterialApp(
      home: NavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}