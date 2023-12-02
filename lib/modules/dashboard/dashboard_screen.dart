import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/global/widget/date_time_pickers.dart';
import 'package:meal_management/global/widget/error_button.dart';
import 'package:meal_management/global/widget/global_indicator.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/modules/dashboard/components/button_section.dart';
import 'package:meal_management/modules/dashboard/components/member_details.dart';
import 'package:meal_management/modules/dashboard/components/my_drawer.dart';
import 'package:meal_management/modules/dashboard/controller/dashboard_controller.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

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
      controller.getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Management Dashboard'),
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
          final controller = context.read(dashboardController.notifier);
          final state = ref.watch(dashboardController);
          final data = state.dashboardResponse?.data;
          return RefreshIndicator(
            onRefresh: () async {
              controller.getDashboardData();
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
                  child: GlobalDateRangePicker(
                      borderColor: KColor.grey.color,
                      titleColor: Colors.blue,
                      firstDayOfMonth: controller.startDate,
                      lastDayOfMonth: controller.endDate,
                      onDateRangeSelected: (pickedDate) {
                        controller.startDate = pickedDate.start;
                        controller.endDate = pickedDate.end;
                        controller.getDashboardData();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state.isError
                      ? ErrorButton(onTap: () {
                          Future(() {
                            controller.getUserData();
                          });
                        })
                      : state.isUserDataLoading
                          ? const Padding(
                              padding: EdgeInsets.only(top: 100),
                              child: GlobalIndicator(),
                            )
                          : Stack(
                              children: [
                                state.isLoading
                                    ? const Positioned(
                                        right: 5,
                                        top: 5,
                                        child: GlobalIndicator())
                                    : const SizedBox.shrink(),
                                Column(
                                  children: [
                                    _buildStatRow(
                                      title: 'Total Member',
                                      value:
                                          data?.totalMembers?.toString() ?? "0",
                                      icon: Icons.person,
                                    ),
                                    _buildStatRow(
                                      title: 'Utility Costing',
                                      value:
                                          data?.totalUtilityCost?.toString() ??
                                              "0",
                                      icon: Icons.paid,
                                    ),
                                    _buildStatRow(
                                      title: 'Bazar Costing',
                                      value: data?.totalBazarCost?.toString() ??
                                          "0",
                                      icon: Icons.shopping_cart,
                                    ),
                                    _buildStatRow(
                                      title: 'Total Meal',
                                      value:
                                          data?.totalMeals?.toString() ?? "0",
                                      icon: Icons.restaurant,
                                    ),
                                    _buildStatRow(
                                      title: 'Cost Per Meals',
                                      value:
                                          data?.costPerMeal?.toString() ?? "0",
                                      //    value: costPerMeal.toStringAsFixed(2),
                                      icon: Icons.paid,
                                    ),
                                    data == null
                                        ? const GlobalText("Wait......")
                                        : Column(
                                            children: [
                                              ...data.allMemberDetails!
                                                  .map((e) =>
                                                      MemberDetailsWidget(
                                                          member: e))
                                                  .toList(),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 60,
                                    )
                                  ],
                                ),
                              ],
                            ),
                ),
              ],
            ),
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
}
