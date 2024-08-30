import 'package:flutter/material.dart';

import '../customWidgets/bottomNavigationBar.dart'; // Import the BottomNavBar widget

class EarningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Earning Screen')),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Set the index for the Jobs tab
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/jobs');
          } else if (index == 2) {
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/profile');
          }
        },
      ),
    );
  }
}
