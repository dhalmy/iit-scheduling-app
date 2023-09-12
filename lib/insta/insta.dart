import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iitschedulingapp/insta/right_side.dart';

import 'left_side.dart';

class Insta extends StatefulWidget {
  const Insta({super.key});

  @override
  State<Insta> createState() => _HomeState();
}

class _HomeState extends State<Insta> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          LeftSide(),
          RightSide(),
        ],
      ),
    );
  }
}