import 'package:cafe_sqlite/core/database.dart';
import 'package:cafe_sqlite/core/entities/food.dart';
import 'package:cafe_sqlite/features/take_order/presentation/list_card.dart';
import 'package:flutter/material.dart';

class ChooseFoodScreen extends StatefulWidget {
  static Route<Food> route({required String foodType, required Database db}) =>
      MaterialPageRoute<Food>(
        builder: (context) => ChooseFoodScreen(
          foodType: foodType,
          db: db,
        ),
      );
  const ChooseFoodScreen({
    super.key,
    required this.foodType,
    required this.db,
  });

  final String foodType;
  final Database db;

  @override
  State<ChooseFoodScreen> createState() => _ChooseFoodScreenState();
}

class _ChooseFoodScreenState extends State<ChooseFoodScreen> {
  List<Food> storedFoods = [];
  String type = '';
  @override
  void initState() {
    initializeLists();
    super.initState();
  }

  void initializeLists() async {
    List<Food> temp = widget.db.getFood();
    setState(() {
      if (widget.foodType == '1 блюда') {
        type = 'first';
      } else {
        type = 'second';
      }
      storedFoods = temp.where((Food food) {
        return food.type == type;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodType),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: storedFoods.length,
        itemBuilder: (BuildContext context, int index) {
          return ListCard(
            food: storedFoods[index],
          );
        },
      ),
    );
  }
}
