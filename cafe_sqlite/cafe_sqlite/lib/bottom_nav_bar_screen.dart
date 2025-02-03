import 'package:cafe_sqlite/core/database.dart';
import 'package:cafe_sqlite/features/choose_table/presentation/main_screen.dart';
import 'package:cafe_sqlite/features/my_orders/presentation/my_orders.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BottomNavBarScreen(),
      );
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedTabIndex = 0;
  final Database db = Database();

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  List<List> foodTitleExamples = [
    ["Crisps", 500],
    ["Burger", 789],
    ["Cake", 1250],
    ["Hot dog", 999],
    ["Doner", 1350],
    ["EXTRA cool Burger", 1600],
  ];
  List<List> drinkTitleExamples = [
    ["Coca Cola 0.5", 500],
    ["Pepsi 0.5", 789],
    ["Water 0.5", 1250],
    ["Cofe", 999],
    ["Green Tea", 1350],
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      ChooseRoomScreen(db: db),
      MyOrdersScreen(db: db),
    ];
    return Scaffold(
      body: IndexedStack(
        index: selectedTabIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 26,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Принять Заказ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            label: 'Заказы',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }
}
