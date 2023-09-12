import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:iitschedulingapp/vertical_nav_bar.dart';
import 'dart:ui_web' as ui;
import 'package:universal_html/html.dart' as html;

void main() {
  ui.platformViewRegistry
      .registerViewFactory('example', (_) => html.DivElement()..innerText = 'Hello, HTML!');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VerticalNavigationBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}