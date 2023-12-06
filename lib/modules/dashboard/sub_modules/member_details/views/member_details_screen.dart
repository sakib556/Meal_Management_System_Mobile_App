import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/global/widget/error_button.dart';
import 'package:meal_management/global/widget/global_indicator.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/controller/member_details_controller.dart';
import 'package:meal_management/modules/dashboard/sub_modules/member_details/model/member_details_response.dart';
import 'package:meal_management/utils/date_time_util.dart';
import 'package:meal_management/utils/extension.dart';
import 'package:meal_management/widgets/double_page.dart';

class MemberDetailsScreen extends StatefulWidget {
  final MemberParameter memberParameter;

  const MemberDetailsScreen({super.key, required this.memberParameter});

  @override
  State<MemberDetailsScreen> createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  @override
  void initState() {
    getCall();
    super.initState();
  }

  Future<void> getCall() async {
    final controller = context.read(memberDetailsController.notifier);
    Future(() {
      controller.getMemberDetailsData(
          memberId: int.parse(widget.memberParameter.member.id!),
          startDate: DateTimeUtil.formatDate(widget.memberParameter.startDate),
          endDate: DateTimeUtil.formatDate(widget.memberParameter.endDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.memberParameter.member.memberName} Details'),
      ),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final controller = context.read(memberDetailsController.notifier);
          final state = ref.watch(memberDetailsController);
          final data = state.memberDetailsResponse?.data;
          if (state.isLoading) {
            return const GlobalIndicator();
          }
          if (state.isError) {
            return ErrorButton(onTap: () {
              getCall();
            });
          }

          if (data != null) {
            return DoublePage(
              firstPageTitle: "Meals",
              firstPageWidget: MealList(meals: data.meals),
              secondPageTitle: "Costs",
              secondPageWidget: CostListPage(
                costs: data.costs,
              ),
            );
          }
          return const GlobalIndicator();
        },
      ),
    );
  }
}

class MealList extends StatelessWidget {
  final List<Meal> meals;

  const MealList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? _buildEmptyState()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: meals.length,
            itemBuilder: (context, index) {
              Meal meal = meals[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: const Icon(
                    Icons.restaurant,
                    color: Colors.orange,
                    size: 50,
                  ), // Meal icon
                  title: Text(
                    'Meal Count: ${meal.mealCount}',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Date: ${DateTimeUtil.dateFormattingYMD(meal.mealDate)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            },
          );
  }

  Widget _buildEmptyState() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fastfood, size: 100.0, color: Colors.grey),
          SizedBox(height: 16.0),
          Text(
            'No meals recorded yet',
            style: TextStyle(fontSize: 20.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CostListPage extends StatelessWidget {
  final List<Cost> costs;

  const CostListPage({Key? key, required this.costs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return costs.isEmpty
        ? _buildEmptyState()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: costs.length,
            itemBuilder: (context, index) {
              Cost cost = costs[index];
              return CostCard(cost: cost);
            },
          );
  }

  Widget _buildEmptyState() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.money_off, size: 100.0, color: Colors.grey),
          SizedBox(height: 16.0),
          Text(
            'No costs recorded yet',
            style: TextStyle(fontSize: 20.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CostCard extends StatelessWidget {
  final Cost cost;

  const CostCard({Key? key, required this.cost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData = cost.costType == "Bazar"
        ? Icons.shopping_cart
        : Icons.home_repair_service;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Icon(
            iconData,
            color: Colors.blue,
            size: 50,
          ),
          title: Text(
            cost.costType,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amount: ${cost.amount}',
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4.0),
              Text('Details: ${cost.details}'),
              const SizedBox(height: 4.0),
              Text('Date: ${DateTimeUtil.dateFormattingYMD(cost.costDate)}'),
            ],
          ),
        ),
      ),
    );
  }
}
