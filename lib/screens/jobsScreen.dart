import 'package:flutter/material.dart';

import '../customWidgets/bottomNavigationBar.dart'; // Import the BottomNavBar widget

class JobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Jobs Screen')),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Set the index for the Jobs tab
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (index == 1) {
            // Already on the Jobs screen
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed('/earnings');
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed('/profile');
          }
        },
      ),
    );
  }
}
