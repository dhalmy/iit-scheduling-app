import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  @override
  Dropdownliststate createState() => Dropdownliststate();
}

class Dropdownliststate extends State<DropDownList> {
  // examples
  List<String> items = ['2021FALL', '2022SPRING', '2022SUMMER', '2023FALL'];

  // current item 
  String selectedItem = '2021FALL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semester drop down'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selected Item: $selectedItem'),
            const SizedBox(height: 20.0),
            // create the dropdown button.
            DropdownButton<String>(
              value: selectedItem, // selected item.
              onChanged: (newValue) {
                // change state based on selected item
                setState(() {
                  selectedItem = newValue!;
                });
              },
              items: items.map((item) {
                // create a dropdown menu item for each item in the list.
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
