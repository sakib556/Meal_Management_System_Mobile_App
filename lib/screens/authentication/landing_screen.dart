import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meal_management/screens/authentication/login_screen.dart';
import 'package:meal_management/screens/home/home_screen.dart';

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
      backgroundColor: Colors.green,
      body: FutureBuilder<DataSnapshot?>(
        future: loginCheck,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.value != null) {
              return const HomeScreen();
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
