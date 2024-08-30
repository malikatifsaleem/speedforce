# SPEEDFORCETASK

Overview
This app includes the following screens:

Login Screen - Allows users to log in with static credentials.
Signup Screen - Enables new user registration.
Home Screen - Serves as the landing page after login/signup.
Profile Screen - Displays user profile details.
Requirements
Flutter SDK (minimum version 3.0.0)
Dart SDK
Setup Instructions
Clone the Repository

bash
Copy code
git clone https://github.com/malikatifsaleem/speedforce.git
cd <REPOSITORY_DIRECTORY>
Install Dependencies

Run the following command to get all the necessary packages:

bash
Copy code
flutter pub get
Run the App

Use the following command to launch the app:

bash
Copy code
flutter run
Screens and Functionality
1. Login Screen
   Purpose: Allows users to log in using static credentials.
   Features:
   Text fields for email and password.
   Email validation to ensure proper format.
   Password validation to ensure non-empty and meets requirements.
   Mock API call to simulate login and fetch user details.
   Error messages for login failures.
   Navigation to the Home Screen upon successful login.
   Static Credentials:
   Email: user@speedforce.com
   Password: password
2. Signup Screen
   Purpose: Enables new users to register for the application.
   Features:
   Fields for name, email, password, and confirm password.
   Validation for all fields (name, email, password, confirm password).
   Navigation to the Home Screen upon successful validation.
   Validation:
   Name should not be empty.
   Email should be in a valid email format.
   Password should meet minimum length and security requirements.
   Confirm password must match the password field.
3. Home Screen
   Purpose: Serves as the landing page after successful login or signup.
   Features:
   Displays a welcome message with the static email (user@speedforce.com).
   Header with basic details and total earnings.
   Invitation message to join the app.
4. Profile Screen
   Purpose: Displays user profile details.
   Features:
   Shows user information fetched from the mock API used in the login process.
   Button to navigate back to the Home Screen.
   Mock API Setup
   If you need to set up a mock API for login or profile details, you can use services like Mocky or JSONPlaceholder to create endpoints that return static data. Update the app's API endpoints with the URLs of your mock API services.

Design and Architectural Decisions
State Management: Provider is used for managing state and authentication throughout the app.
Code Reusability: Custom widgets and components are designed for reusability across different screens.
Validation: Input fields are validated both on the client side for format and completeness.
Troubleshooting
Ensure your Flutter SDK is up to date.
Verify that all dependencies are correctly installed.
If you encounter any issues with the mock API, check the API URLs and data format.
