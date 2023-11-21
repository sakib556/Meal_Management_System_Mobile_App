import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:meal_management/modules/dashboard/components/my_drawer.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_form.dart';
import 'package:meal_management/utils/bottom_sheet_util.dart';

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
              SheetUtil.globalBottomSheet(
                  context: context, child: MemberForm());
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

class MemberAccountModel {
  String memberName;
  String deposite;
  String cost;
  String balance;

  MemberAccountModel(this.memberName, this.deposite, this.cost, this.balance);
}
