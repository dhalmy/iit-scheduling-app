import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'account/account_button.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3), // Make gray more transparent
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AccountButton(),
        ],
      ),
    );
  }
}