import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_management/screens/home_screen.dart';
import 'package:meal_management/screens/login_screen.dart';
import 'package:meal_management/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

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
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Center(
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
                            Icons.food_bank,
                            size: 80,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Create an Account',
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
                        label: 'Password',
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      PasswordTextField(
                        label: 'Confirm Password',
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(height: 30),
                      isLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                // Implement the signup logic here.
                                print("Email: ${emailController.text}");
                                print("Password: ${passwordController.text}");
                                print(
                                    "Confirm Password: ${confirmPasswordController.text}");
                                _handleSignup(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                              ),
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignup(BuildContext context) async {
    try {
      isLoading = true;
      setState(() {});
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        EasyLoading.showError('Please fill all the fields.');
        isLoading = false;
        setState(() {});
        return;
      }

      if (password != confirmPassword) {
        isLoading = false;
        setState(() {});
        EasyLoading.showError('Passwords do not match');
        return;
      }

      // Show loading indicator while signing up

      // Create the user with Firebase authentication
      UserCredential response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        // Successfully logged in

        // Get the device token
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        String? deviceToken = await messaging.getToken();
        if (deviceToken != null) {
          // Save the device token to the RTDB
          await FirebaseDatabase.instance
              .ref()
              .child('users/${response.user?.uid}/device_token')
              .set(deviceToken);
        }
        isLoading = false;
        setState(() {});
        pushNavigateTo(context, const HomeScreen());
        print('Signup successful! UserID: ${response.user?.uid}');
      } else {
        EasyLoading.showError("User null!");
      }
      // Signup successful, you can navigate to the next screen or do anything else you need

      // Hide loading indicator after signup is complete
      isLoading = false;
      setState(() {});
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      setState(() {});
      // Handle Firebase authentication errors
      print('Signup failed with error: ${e.message}');
      EasyLoading.showError(e.message ?? "Something went wrong!!");
    } catch (e) {
      isLoading = false;
      setState(() {});
      // Handle other errors
      print('Signup failed with unknown error: $e');
      EasyLoading.showError('Signup failed. Please try again later.');
    } finally {
      isLoading = false;
      setState(() {});
    }
  }
}
