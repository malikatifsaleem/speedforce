import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/loginProvider.dart';

import '../customWidgets/CustomTextFormField.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../customWidgets/RegisterationButtons.dart';
import '../customWidgets/customAuthButtons.dart';
import '../customWidgets/signUp_prompt.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController businessNameController =
      TextEditingController(); // For Service Provider

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
              Navigator.pop(context);
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
        body: TabBarView(
          children: [
            _buildConsumerForm(context, authProvider),
            _buildServiceProviderForm(context, authProvider),
          ],
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
            controller: nameController,
            hintText: 'First Name',
            icon: Icons.person,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Last Name',
            icon: Icons.person,
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
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Gender',
            icon: Icons.person,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Phone Number',
            icon: Icons.phone,
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
              onPressed: () async {}),
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
          // CustomTextFormField(
          //   controller: businessNameController,
          //   hintText: 'Business Name',
          //   icon: Icons.business,
          // ),
          // SizedBox(height: 16),
          // CustomTextFormField(
          //   controller: nameController,
          //   hintText: 'First Name',
          //   icon: Icons.person,
          // ),
          // ... other form fields ...
          CustomTextFormField(
            controller: businessNameController,
            hintText: 'Business Name',
            icon: Icons.business,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'First Name',
            icon: Icons.person,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Last Name',
            icon: Icons.person,
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
              return null;
            },
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Gender',
            icon: Icons.person,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Phone Number',
            icon: Icons.phone,
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
    onPressed: () async {}),
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.black),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//
//                Text(
//                 "Create Account",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//       ]),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.email),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               controller: confirmPasswordController,
//               decoration: InputDecoration(
//                 labelText: 'Confirm Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Validate and signup action
//               },
//               child: Text("Sign Up"),
//             ),
//             SizedBox(height: 10),
//             Text("or continue with"),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.facebook),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.person),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Already have an account? Log in"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
