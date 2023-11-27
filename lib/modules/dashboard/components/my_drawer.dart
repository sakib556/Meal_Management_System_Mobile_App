import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_management/modules/authentication/login_screen.dart';
import 'package:meal_management/modules/dashboard/sub_modules/cost_form/views/cost_form.dart';
import 'package:meal_management/modules/dashboard/sub_modules/meal_form.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_form.dart';
import 'package:meal_management/utils/bottom_sheet_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late SharedPreferences _prefs;
  String profileImagePath = '';
  bool isLogoutLoading = false;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      profileImagePath =
          _prefs.getString('profileImagePath') ?? profileImagePath;
    });
  }

  Future<void> _logout(BuildContext context) async {
    try {
      isLogoutLoading = true;
      setState(() {});
      await FirebaseAuth.instance.signOut();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseDatabase.instance
            .ref()
            .child('users/${user.uid}/device_token')
            .remove();
      }
      isLogoutLoading = false;
      setState(() {});
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      // After logout, navigate to the LoginScreen
    } catch (e) {
      isLogoutLoading = false;
      setState(() {});
      EasyLoading.showError(e.toString());
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                // Adjusted avatar size
                profileImagePath.isNotEmpty
                    ? Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              40), // Half of the square size
                          child: Image.file(
                            File(profileImagePath),
                            width: 80, // Square avatar size
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const Center(
                        child: CircleAvatar(
                          radius: 40, // Half of the square size
                          child: Icon(
                            Icons.account_circle,
                            size: 80, // Adjusted icon size
                          ),
                        ),
                      ),
                Text(
                  FirebaseAuth.instance.currentUser?.email ?? "No email",
                  style: const TextStyle(fontSize: 18),
                ),

                // Text(FirebaseAuth.instance.currentUser!.displayName ??
                //     "No name"),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(' My Profile '),
            onTap: () {
              //   Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Add Member'),
            onTap: () {
              SheetUtil.globalBottomSheet(
                  context: context, child: const MemberForm());
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Add Meal'),
            onTap: () {
              SheetUtil.globalBottomSheet(
                  context: context, child: const MealForm());
            },
          ),
          ListTile(
            leading: const Icon(Icons.paid),
            title: const Text('Add Cost'),
            onTap: () {
              SheetUtil.globalBottomSheet(
                  context: context, child: const CostForm());
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          isLogoutLoading
              ? const CircularProgressIndicator()
              : ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    _logout(
                        context); // Call the logout function with the context
                  },
                ),
        ],
      ),
    );
  }
}
