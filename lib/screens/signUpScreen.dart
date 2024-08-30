import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/loginProvider.dart';
import '../customWidgets/CustomTextFormField.dart';
import '../customWidgets/RegisterationButtons.dart';
import '../customWidgets/customAuthButtons.dart';
import '../customWidgets/signUp_prompt.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController businessNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          title: Text(
            'Create Account',
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 1.2,
              color: Color(0xFF212121),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xFFEC3F2E),
            labelColor: Color(0xFFEC3F2E),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Consumer'),
              Tab(text: 'Service Provider'),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: TabBarView(
            children: [
              _buildConsumerForm(context, authProvider),
              _buildServiceProviderForm(context, authProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConsumerForm(BuildContext context, LoginProvider authProvider) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        children: [
          CustomTextFormField(
            controller: firstNameController,
            hintText: 'First Name',
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: lastNameController,
            hintText: 'Last Name',
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            icon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomAuthButton(
            label: 'Sign Up',
            isLoading: authProvider.isLoading,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Navigate to the home screen after validation
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
          SizedBox(height: 16),
          AuthButtons(
            onFacebookTap: authProvider.signInWithFacebook,
            onGoogleTap: authProvider.signInWithGoogle,
          ),
          SignInPrompt(
            onSignInTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceProviderForm(
      BuildContext context, LoginProvider authProvider) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        children: [
          CustomTextFormField(
            controller: businessNameController,
            hintText: 'Business Name',
            icon: Icons.business,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your business name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: firstNameController,
            hintText: 'First Name',
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: lastNameController,
            hintText: 'Last Name',
            icon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            icon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            icon: Icons.lock,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomAuthButton(
            label: 'Sign Up',
            isLoading: authProvider.isLoading,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Navigate to the home screen after validation
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
          SizedBox(height: 16),
          AuthButtons(
            onFacebookTap: authProvider.signInWithFacebook,
            onGoogleTap: authProvider.signInWithGoogle,
          ),
          SignInPrompt(
            onSignInTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
