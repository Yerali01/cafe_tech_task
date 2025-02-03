import 'package:cafe_sqlite/bottom_nav_bar_screen.dart';
import 'package:cafe_sqlite/core/database.dart';
import 'package:cafe_sqlite/core/entities/food.dart';
import 'package:cafe_sqlite/core/entities/order.dart';
import 'package:cafe_sqlite/features/take_order/presentation/choose_food_screen.dart';
import 'package:cafe_sqlite/features/take_order/presentation/grid_card.dart';
import 'package:cafe_sqlite/features/take_order/presentation/text_card.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TakeOrderScreen extends StatefulWidget {
  static route(String room, int tableNo, Database db) => MaterialPageRoute(
        builder: (context) => TakeOrderScreen(
          room: room,
          tableNo: tableNo,
          db: db,
        ),
      );
  final String room;
  final int tableNo;
  final Database db;
  const TakeOrderScreen({
    super.key,
    required this.room,
    required this.tableNo,
    required this.db,
  });

  @override
  State<TakeOrderScreen> createState() => _TakeOrderScreenState();
}

class _TakeOrderScreenState extends State<TakeOrderScreen> {
  List<Food> storedFoods = [];
  List<Food> storedDrinks = [];
  List<Food> takenFoods = [];

  @override
  void initState() {
    initializeLists();
    super.initState();
  }

  void initializeLists() async {
    List<Food> temp = widget.db.getFood();
    setState(() {
      storedFoods = temp;
      storedDrinks = temp.where((Food food) {
        return food.type == 'drink';
      }).toList();
    });
  }

  void _navigateAndAddItem(String foodType) async {
    Food? newItem = await Navigator.push(
      context,
      ChooseFoodScreen.route(foodType: foodType, db: widget.db),
    );

    if (newItem != null) {
      setState(() {
        takenFoods.add(newItem.copyWith(orderCount: 1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.room} - Столик #${widget.tableNo}'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: takenFoods.length,
                itemBuilder: ((BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(takenFoods[index].title),
                          Text('${takenFoods[index].cost}'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                takenFoods[index].orderCount += 1;
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            '${takenFoods[index].orderCount}',
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (takenFoods[index].orderCount > 0) {
                                  takenFoods[index].orderCount -= 1;
                                } else {
                                  setState(() {
                                    takenFoods.remove(takenFoods[index]);
                                  });
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ).copyWith(top: 40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 150,
                ),
                children: [
                  GestureDetector(
                    onTap: () => _navigateAndAddItem('1 блюда'),
                    child: const TextCard(
                      title: '1 блюда',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _navigateAndAddItem('2 блюда'),
                    child: const TextCard(
                      title: '2 блюда',
                    ),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ).copyWith(
                  bottom: 40,
                  top: 20,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 12,
                  mainAxisExtent: 150,
                ),
                itemCount: storedDrinks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final existingFoodIndex = takenFoods.indexWhere(
                          (food) => food.id == storedDrinks[index].id);

                      setState(() {
                        if (existingFoodIndex != -1) {
                          // If food already exists, increment its count
                          takenFoods[existingFoodIndex] =
                              takenFoods[existingFoodIndex].copyWith(
                                  orderCount:
                                      takenFoods[existingFoodIndex].orderCount +
                                          1);
                        } else {
                          // If food doesn't exist, add it with count 1
                          takenFoods
                              .add(storedDrinks[index].copyWith(orderCount: 1));
                        }
                      });
                    },
                    child: GridCard(
                      food: storedDrinks[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_right,
          size: 48,
        ),
        onPressed: () {
          if (takenFoods.isEmpty) return;

          final newOrder = Order(
            id: const Uuid().v4(),
            room: widget.room,
            tableNo: widget.tableNo,
            foods: List<Food>.from(takenFoods),
          );

          widget.db.addToOrders(newOrder);
          Navigator.pop(context);
          Navigator.pop(context);
          // Navigator.remove(
          // context,
          // MaterialPageRoute(builder: (context) => BottomNavBarScreen()),
          // (Route<dynamic> route) => false,
          // );
        },
      ),
    );
  }
}
