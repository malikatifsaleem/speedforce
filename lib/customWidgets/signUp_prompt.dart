import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignInPrompt extends StatelessWidget {
  final Function onSignInTap;

  const SignInPrompt({
    Key? key,
    required this.onSignInTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.03),
        Center(
          child: Text.rich(
            TextSpan(
              text: "Already have an account? ",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Sign In",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: screenWidth * 0.04,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => onSignInTap(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
