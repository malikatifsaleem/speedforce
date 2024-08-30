import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  final Function onFacebookTap;
  final Function onGoogleTap;

  const AuthButtons({
    Key? key,
    required this.onFacebookTap,
    required this.onGoogleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.03),
        Row(
          children: [
            Expanded(child: Divider(thickness: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("or continue with"),
            ),
            Expanded(child: Divider(thickness: 1)),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onFacebookTap(),
              child: Image.asset(
                'assets/facebook_icon.png',
                width: 45.0,
                height: 45.0,
              ),
            ),
            SizedBox(width: 16.0),
            GestureDetector(
              onTap: () => onGoogleTap(),
              child: Image.asset(
                'assets/google_icon.png',
                width: 30.0,
                height: 30.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
