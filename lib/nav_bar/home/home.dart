import 'package:flutter/material.dart';
import 'package:iitschedulingapp/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: deviceWidth * 0.9,
        height: deviceHeight * 0.9,
        child: Container(
            width: deviceWidth * 0.9,
            height: deviceHeight * 0.9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Color(0xFF0f0530),
                  Color(0xFF5e48ab),
                  Color(0xFF0f0530),
                ],
              ),
            ),
            child: const Center(),
        ),
      ),
    );
  }
}