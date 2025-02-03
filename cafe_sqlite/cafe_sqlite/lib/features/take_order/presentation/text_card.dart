import 'package:cafe_sqlite/features/take_order/presentation/choose_food_screen.dart';
import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    super.key,
    required this.title,
  });
  final String title;
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
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
