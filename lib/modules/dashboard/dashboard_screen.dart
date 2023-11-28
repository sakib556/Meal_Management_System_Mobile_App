import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/modules/dashboard/components/button_section.dart';
import 'package:meal_management/modules/dashboard/components/my_drawer.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_controller.dart';
import 'package:meal_management/utils/extension.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    final controller = context.read(dashboardController.notifier);
    Future(() {
      controller.getDashboardData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          // IconButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, AddMemberPage.routeName);
          //     },
          //     icon: const Icon(Icons.person_add_alt_1))
        ],
      ),
      drawer: const MyDrawer(),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final state = ref.watch(dashboardController);
          final data = state.dashboardResponse?.data;
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildStatRow(
                      title: 'Total Member',
                      value: data?.totalMembers?.toString() ?? "0",
                      icon: Icons.person,
                    ),
                    _buildStatRow(
                      title: 'Utility Costing',
                      value: data?.totalUtilityCost?.toString() ?? "0",
                      icon: Icons.paid,
                    ),
                    _buildStatRow(
                      title: 'Bazar Costing',
                      value: data?.totalBazarCost?.toString() ?? "0",
                      icon: Icons.shopping_cart,
                    ),
                    _buildStatRow(
                      title: 'Total Meal',
                      value: data?.totalMeals?.toString() ?? "0",
                      icon: Icons.restaurant,
                    ),
                    _buildStatRow(
                      title: 'Cost Per Meals',
                      value: data?.costPerMeal?.toString() ?? "0",
                      //    value: costPerMeal.toStringAsFixed(2),
                      icon: Icons.paid,
                    ),
                    // _buildStatRow(
                    //   title: 'Remaining Balance',
                    //   value: totalRemainingBalance.toStringAsFixed(2),
                    //   icon: Icons.balance,
                    // ),
                  ],
                ),
              ),
              _buildCard('Personal Info', [
                _buildInfoRow(
                    'My Deposit',
                    _buildHorizontalListView(
                        ['MR Kamal', '100 tk'], ['MR Jamal', '100 tk'])),
                _buildInfoRow(
                    'All Meals',
                    _buildHorizontalListView(
                        ['MR Kamal', '100 tk'], ['MR Jamal', '100 tk'])),
              ]),
              _memberCostings(),
            ],
          );
        },
      ),
      floatingActionButton: const ButtonSection(),
    );
  }

  Widget _buildStatRow(
      {required String title, required String value, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Text('$title:'),
          const SizedBox(width: 5),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Padding(
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
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, Widget horizontalListView) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(title),
        ),
        horizontalListView,
      ],
    );
  }

  Widget _buildHorizontalListView(List<String> data1, List<String> data2) {
    return SizedBox(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < data1.length; i++)
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
                      Text(data1[i]),
                      Text(data2[i]),
                    ],
                  ),
                ),
              ),
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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Total Member : 2',
                  style: TextStyle(fontSize: 16),
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
                            child: const Column(
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
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("MR Jamal"),
                                Text("100 tk"),
                              ],
                            ))),
                  ),
                ]),
            const SizedBox(
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

class MemberAccountModel {
  String memberName;
  String deposite;
  String cost;
  String balance;

  MemberAccountModel(this.memberName, this.deposite, this.cost, this.balance);
}
