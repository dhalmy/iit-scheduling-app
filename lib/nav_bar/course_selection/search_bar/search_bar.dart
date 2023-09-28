import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/search_bar/autocomplete.dart';
import 'dart:io' show Platform;

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0, // Set the width of the search bar
      padding: const EdgeInsets.all(10.0), // Add padding to the container
      margin: const EdgeInsets.all(20.0), // Add margin around the container
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set the background color to a light gray
        borderRadius: BorderRadius.circular(5.0), // Apply a border radius for rounded corners
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...', // Placeholder text for the search input
                border: InputBorder.none, // Remove the input border
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search), // Search icon
            onPressed: () {
              const autoCompleteFunction();
              const AutocompleteBasicExample();
              // Implement your search functionality here
              // This onPressed function will be called when the search button is pressed.
            },
          ),
        ],
      ),
    );
  }
}