import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool rememberMe = false;
  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Notifies listeners to rebuild UI if necessary
  }

  Future<void> login(String email, String password) async {
    setLoading(true);
    final url = Uri.parse('https://my-json-server.typicode.com/hameezk/HiringTask/login');
    final Map<String, dynamic> requestBody = {'email': email, 'password': password};
    final response = await http.get(url, headers: {'Content-Type': 'application/json'});

    setLoading(false);
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _user = User.fromJson(jsonResponse['data'] as Map<String, dynamic>);
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<User> fetchUserData() async {
    final url = Uri.parse('https://my-json-server.typicode.com/hameezk/HiringTask/login');
    final response = await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse['data'] as Map<String, dynamic>);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  void logout() {
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isLoading = !isLoading;
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    if (value != null) {
      _isLoading = value;
      notifyListeners();
    }
  }

  void signInWithGoogle() {
    // Handle Google Sign-In
  }

  void signInWithFacebook() {
    // Handle Facebook Sign-In
  }
}
