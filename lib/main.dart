import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/loginProvider.dart';
import 'package:task/screens/earningScreen.dart';
import 'package:task/screens/jobsScreen.dart';
import 'dart:async';
import 'customWidgets/customLoader.dart';
import 'screens/loginScreen.dart';
import 'screens/signUpScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/profileScreen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Speedforce App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:
          '/', // This is the first screen that will be shown (SplashScreen)
      routes: {
        '/': (context) => SplashScreen(), // Splash Screen
        '/login': (context) => LoginScreen(), // Login Screen
        '/signup': (context) => SignupScreen(), // Signup Screen
        '/home': (context) => HomeScreen(), // Home Screen
        '/jobs': (context) => JobsScreen(), // Home Screen
        '/earnings': (context) => EarningScreen(), // Home Screen
        '/profile': (context) => ProfileScreen() // Profile Screen
      },
    ));
  }
}
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),
            Spacer(),
            CustomLoader(),
            SizedBox(height: 50), // Adjust as necessary for padding
          ],
        ),
      ),
    );
  }
}


// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacementNamed('/login');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/logo.png'), // Your logo
//             SizedBox(height: 20),
//             CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }
