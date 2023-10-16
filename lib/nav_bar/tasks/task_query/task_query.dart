import 'package:flutter/material.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.945,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [  // Remove shrinkWrap: true
                Row(
                  children: [
                    Expanded(child: CardWidget()),
                    Expanded(child: CardWidget()),
                    Expanded(child: CardWidget()),
                    Expanded(child: CardWidget()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CardWidget()),
                    Expanded(child: CardWidget()),
                    Expanded(child: CardWidget()),
                    Expanded(child: CardWidget()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Card Content',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}