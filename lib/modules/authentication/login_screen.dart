import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_management/modules/authentication/singup_screen.dart';
import 'package:meal_management/modules/dashboard/components/dashboard_screen.dart';
import 'package:meal_management/utils.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool isLoading = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool isLoginLoading = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _fadeAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green[300]!,
              Colors.green[500]!,
              Colors.green[700]!
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _fadeAnimation,
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.lock,
                        size: 60,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Member Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PasswordTextField(
                    label: "Password",
                    controller: passwordController,
                  ),
                  const SizedBox(height: 30),
                  isLoginLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            print(
                                "email : ${emailController.text} pass :${passwordController.text} ");
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              EasyLoading.showError(
                                  "Please enter email and password.");
                              return;
                            }
                            _login(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    try {
      isLoginLoading = true;
      setState(() {});
      final String email = emailController.text;
      final String password = passwordController.text;
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        String? deviceToken = await messaging.getToken();
        if (deviceToken != null) {
          // Save the device token to the RTDB
          await FirebaseDatabase.instance
              .ref()
              .child('users/${response.user?.uid}/device_token')
              .set(deviceToken);
        }
        pushNavigateTo(context, const DashboardScreen());
      } else {
        EasyLoading.showSuccess("User null!");
      }
      isLoginLoading = false;
      setState(() {});
    } catch (e) {
      EasyLoading.showError(e.toString());
      // Handle login errors, display an error message, or show a snackbar
      print('Login Error: $e');
      isLoginLoading = false;
      setState(() {});
    }
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const PasswordTextField(
      {super.key, required this.controller, required this.label});
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText, // Use the _obscureText value here
        decoration: InputDecoration(
          hintText: widget.label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: GestureDetector(
            // Wrap the icon with GestureDetector
            onTap: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle the obscureText value
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}
