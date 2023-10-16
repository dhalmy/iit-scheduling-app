import 'package:flutter/material.dart';

class YearSemesterDropDown extends StatefulWidget {
  const YearSemesterDropDown({super.key});

  @override
  State<YearSemesterDropDown> createState() => _YearSemesterDropDownState();
}

class _YearSemesterDropDownState extends State<YearSemesterDropDown> {
  // examples
  List<String> items = ['2021FALL', '2022SPRING', '2022SUMMER', '2023FALL'];

  // current item
  String selectedItem = '2021FALL';

  @override
  Widget build(BuildContext context) {
    double dropdownWidth = MediaQuery.of(context).size.width * 0.12; // 12% of screen width

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 15),
          // create the dropdown button wrapped in a Container
          SizedBox(
            width: dropdownWidth, // Set the width here
            child: DropdownButton<String>(
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
          ),
          Text('Selected Item: $selectedItem'),
        ],
      ),
    );
  }
}