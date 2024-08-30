import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/loginProvider.dart';
import '../customWidgets/CustomTextFormField.dart';
import '../customWidgets/RegisterationButtons.dart';
import '../customWidgets/customAuthButtons.dart'; // Import your custom button

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  // Navigator.pop(context);
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Image.asset(
                  'assets/logo.png', // Your logo asset path
                  width: screenWidth * 0.6,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controller: authProvider.emailController,
                      hintText: 'Email',
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextFormField(
                      controller: authProvider.passwordController,
                      hintText: 'Password',
                      icon: Icons.lock,
                      obscureText: !authProvider.isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          authProvider.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: authProvider.togglePasswordVisibility,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Checkbox(
                          value: authProvider.rememberMe,
                          onChanged: authProvider.toggleRememberMe,
                          activeColor: Colors.red,
                          checkColor: Colors.white,
                        ),
                        Expanded(
                          child: Text("Remember me"),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomAuthButton(
                      label: 'Log In',
                      isLoading: authProvider.isLoading,
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          authProvider.setLoading(true);
                          try {
                            await authProvider.login(
                              authProvider.emailController.text,
                              authProvider.passwordController.text,
                            );
                            authProvider.setLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login Successful!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).pushReplacementNamed('/home');
                          } catch (e) {
                            authProvider.setLoading(false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login Failed: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle forgot password
                        },
                        child: Text(
                          "Forgot the password?",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    AuthButtons(
                      onFacebookTap: authProvider.signInWithFacebook,
                      onGoogleTap: authProvider.signInWithGoogle,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: screenWidth * 0.04),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, '/signup');
                                  })
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
