import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:meal_management/screens/authentication/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double sumofCost = 0;
  double totalCost = 0;
  double sumofDeposit = 0;
  double sumofMeals = 0;
  double totalDeposit = 0;
  double totalMeals = 0;
  double totalRemainingBalance = 0;
  bool callOnce = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, AddMemberPage.routeName);
          //     },
          //     icon: const Icon(Icons.person_add_alt_1))
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Icon(Icons.home),
                const SizedBox(
                  width: 5,
                ),
                const Text('Total Deposit : '),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(totalDeposit.toString()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Icon(Icons.home),
                const SizedBox(
                  width: 5,
                ),
                const Text('Total Costing : '),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(totalCost.toString()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Icon(Icons.home),
                const SizedBox(
                  width: 5,
                ),
                const Text('Remaining Balance : '),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text((totalRemainingBalance = totalDeposit - totalCost)
                      .toString()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Icon(Icons.home),
                const SizedBox(
                  width: 5,
                ),
                const Text('Total Meals : '),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(totalMeals.toString()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                const Icon(Icons.home),
                const SizedBox(
                  width: 5,
                ),
                const Text('Cost Per Meals : '),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text((totalCost / totalMeals).toStringAsFixed(2)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text('Personal Info'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('My Deposit'),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.center,
                                      color: Colors.green,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("MR Kamal"),
                                          Text("100 tk"),
                                        ],
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.center,
                                      color: Colors.green,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("MR Jamal"),
                                          Text("100 tk"),
                                        ],
                                      ))),
                            ),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('All Meals'),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.center,
                                      color: Colors.green,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("MR Kamal"),
                                          Text("100 tk"),
                                        ],
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.center,
                                      color: Colors.green,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("MR Jamal"),
                                          Text("100 tk"),
                                        ],
                                      ))),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _memberCostings()
        ],
      ),

      // TODO floating action button start
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        foregroundColor: Colors.grey,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.white,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        animationDuration: const Duration(milliseconds: 250),
        spacing: 10,
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            onTap: () {
              // Navigator.of(context).pushNamed(AddMealPage.routeName);
            },
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.white,
            child: const Icon(
              Icons.restaurant,
              color: Colors.grey,
            ),
            label: 'Add Meal',
            labelStyle: const TextStyle(color: Colors.grey),
          ),
          SpeedDialChild(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed(AddMealPage.routeName)
              //     .then((value) {
              //   Provider.of<MembersMealProvider>(context, listen: false)
              //       ////////////////////
              //       .dropdown_items_cost
              //       .clear();
              // });
            },
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.white,
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            label: 'Add Meal Cost',
            labelStyle: const TextStyle(color: Colors.grey),
          ),
          SpeedDialChild(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed(AddMemberPage.routeName)
              //     .then((value) {
              //   Provider.of<MembersMealProvider>(context, listen: false)
              //       /////
              //       .dropdown_items_deposit
              //       .clear();
              // });
            },
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.white,
            child: const Icon(
              Icons.paid,
              color: Colors.grey,
            ),
            label: 'Add Members ',
            labelStyle: const TextStyle(color: Colors.grey),
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            labelBackgroundColor: Colors.white,
            onTap: () {
              //Navigator.pushNamed(context, MemberList.routeName);
            },
            child: const Icon(
              Icons.alarm_on,
              color: Colors.grey,
            ),
            label: 'Active Month Details',
            labelStyle: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  _memberCostings() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Total Member : 2',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Divider(
              height: 5,
            ),
            ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            color: Colors.green,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("MR Kamal"),
                                Text("100 tk"),
                              ],
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            color: Colors.green,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("MR Jamal"),
                                Text("100 tk"),
                              ],
                            ))),
                  ),
                ]),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  Widget showMemberAccountValue(MemberAccountModel m) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                m.memberName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Total cost : ${m.cost.toString()}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Deposite : ${m.deposite.toString()}",
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                "Balance : ${m.balance}",
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getTotalCosting() async {}

  void getTotalDeposit() {}

  void getTotalNoOfMeals() {}
}

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
                  FirebaseAuth.instance.currentUser!.email ?? "No email",
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
            leading: const Icon(Icons.book),
            title: const Text(' Add Costs '),
            onTap: () {
              //   Navigator.pushNamed(context, AddCostsPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            title: const Text(' Add Money'),
            onTap: () {
              //    Navigator.pushNamed(context, AddMembersMoney.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_label),
            title: const Text(' Saved Videos '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class MemberAccountModel {
  String memberName;
  String deposite;
  String cost;
  String balance;

  MemberAccountModel(this.memberName, this.deposite, this.cost, this.balance);
}
