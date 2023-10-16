import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Greetings extends StatefulWidget {
  const Greetings({super.key});

  @override
  State<Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  String greetingText = '';

  @override
  void initState() {
    super.initState();
    _updateGreeting();
  }

  void _updateGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      setState(() {
        greetingText = 'Morning';
      });
    } else if (hour < 17) {
      setState(() {
        greetingText = 'Afternoon';
      });
    } else {
      setState(() {
        greetingText = 'Evening';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Good $greetingText!',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            Text(
              'Current time: ${DateFormat('HH:mm').format(DateTime.now())}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20)
          ],
        ),
      ],
    );
  }
}
