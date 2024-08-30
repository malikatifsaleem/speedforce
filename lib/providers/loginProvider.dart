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
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setLoading(true);

    const staticEmail = 'user@speedforce.com';
    const staticPassword = 'password';

    if (email == staticEmail && password == staticPassword) {
      _user = User(email: staticEmail);
      _isLoggedIn = true;
      notifyListeners();
    } else {
      setLoading(false);
      throw Exception('Invalid email or password');
    }

    setLoading(false);
  }

  static Future<User> fetchUserData() async {
    final url = Uri.parse(
        'https://my-json-server.typicode.com/hameezk/HiringTask/login');
    final response =
    await http.get(url, headers: {'Content-Type': 'application/json'});

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
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleRememberMe(bool? value) {
    if (value != null) {
      rememberMe = value;
      notifyListeners();
    }
  }

  void signInWithGoogle() {}

  void signInWithFacebook() {}
}
