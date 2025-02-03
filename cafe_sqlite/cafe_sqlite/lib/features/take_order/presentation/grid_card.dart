import 'package:cafe_sqlite/core/entities/food.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.food,
  });
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${food.cost}'),
          Text(food.title),
        ],
      ),
    );
  }
}
