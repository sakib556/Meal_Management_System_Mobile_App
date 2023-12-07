import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meal_management/modules/authentication/login_screen.dart';
import 'package:meal_management/modules/dashboard/dashboard_screen.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Future<DataSnapshot?>? loginCheck;

  @override
  void initState() {
    super.initState();
    loginCheck = checkUserLoginStatus();
  }

  Future<DataSnapshot?> checkUserLoginStatus() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return await getUserDeviceToken(user.uid);
      } else {
        return null;
      }
    } catch (e) {
      print('Error checking user login status: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primary.color,
      body: FutureBuilder<DataSnapshot?>(
        future: loginCheck,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingScreen();
          } else if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.value != null) {
              //  return const WaitingWidget();
              return const DashboardScreen();
            } else {
              return const LoginScreen();
            }
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key, this.isSplash = false});
  final bool isSplash;
  @override
  Widget build(BuildContext context) {
    if (isSplash) {
      Timer(
        const Duration(seconds: 2), // You can adjust the delay as needed
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LandingScreen()),
          );
        },
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue.shade300,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Meal Management System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Savoring moments, managing meals.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Icon(
              Icons.restaurant,
              color: Colors.white,
              size: 80,
            ), // Use the restaurant icon for a meal management theme
          ],
        ),
      ),
    );
  }
}

Future<DataSnapshot?> getUserDeviceToken(String userId) async {
  DataSnapshot? snapshot;
  try {
    DatabaseEvent event = await FirebaseDatabase.instance
        .ref()
        .child('users/$userId/device_token')
        .once();
    snapshot = event.snapshot;
  } catch (e) {
    print('Error getting user device token: $e');
  }
  return snapshot;
}
