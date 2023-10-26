// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:meal_management/screens/authentication/login_screen.dart';
// import 'package:meal_management/screens/home/components/home_page.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green[100],
//       drawer: buildDrawer(context),
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         title: const Text(
//           'Meal Management',
//         ),
//         backgroundColor: Colors.green[500],
//       ),
//       body: const HomePage(),
//     );
//   }

//   bool isLogoutLoading = false;
//   Widget buildDrawer(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.green[500],
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   'Hi mr/ms',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//                 Text(
//                   FirebaseAuth.instance.currentUser!.email ?? "",
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           isLogoutLoading
//               ? const CircularProgressIndicator()
//               : ListTile(
//                   leading: const Icon(Icons.logout),
//                   title: const Text('Logout'),
//                   onTap: () {
//                     _logout(
//                         context); // Call the logout function with the context
//                   },
//                 ),
//         ],
//       ),
//     );
//   }


// }

// class RealTimeDataWidget extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;

//   const RealTimeDataWidget(
//       {super.key,
//       required this.icon,
//       required this.label,
//       required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.green[500],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             size: 50,
//             color: Colors.white,
//           ),
//           const SizedBox(height: 10),
//           Text(
//             label,
//             style: const TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             value,
//             style: const TextStyle(color: Colors.white, fontSize: 24),
//           ),
//         ],
//       ),
//     );
//   }
// }
