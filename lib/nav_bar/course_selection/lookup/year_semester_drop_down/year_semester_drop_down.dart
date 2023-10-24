import 'package:flutter/material.dart';
import 'year_semester.dart';

class YearSemesterDropDown extends StatefulWidget {
  const YearSemesterDropDown({Key? key}) : super(key: key);

  @override
  State<YearSemesterDropDown> createState() => _YearSemesterDropDownState();
}

class _YearSemesterDropDownState extends State<YearSemesterDropDown> {
  // Use the enum values for the items
  List<String> items = [
    '2021 - Fall',
    '2022 - Spring',
    '2022 - Summer',
    '2023 - Fall',
  ];

  // current item
  String selectedItem = '2023 - Fall';

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
                  child: Text(item.toString().split('.').last), // Display the enum value as a string
                );
              }).toList(),
            ),
          ),
          Text('Selected Item: ${selectedItem.toString().split('.').last}'), // Display the selected item as a string
        ],
      ),
    );
  }

  // Define a getter method to access the selected item
  String getSelectedYearSemester() {
    return selectedItem;
  }
}