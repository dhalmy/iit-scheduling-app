import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomTab({
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00BD90) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}