import 'package:flutter/material.dart';

class QueryGrid extends StatelessWidget {
  final int rowCount;

  const QueryGrid({
    Key? key,
    this.rowCount = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: rowCount,
        itemBuilder: (BuildContext context, int index) {
          // Add a SizedBox with a small height between rows
          final gap = MediaQuery.of(context).size.width * 0.013; // Adjust the gap height as needed
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: gap),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.105,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text('Hello'),
                  ),
                  SizedBox(width: gap),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.21,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text('Hello'),
                  ),
                  SizedBox(width: gap),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.105,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text('Hello'),
                  ),
                  SizedBox(width: gap),
                ],
              ),
              SizedBox(height: gap), // Add a gap between rows
            ],
          );
        },
      ),
    );
  }
}