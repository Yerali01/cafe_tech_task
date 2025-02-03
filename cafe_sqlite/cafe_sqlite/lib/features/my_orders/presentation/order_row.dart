import 'package:cafe_sqlite/core/entities/order.dart';
import 'package:flutter/material.dart';

class OrderRow extends StatelessWidget {
  const OrderRow({
    super.key,
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context) {
    final int orderCost =
        order.foods.fold(0, (sum, food) => sum + (food.cost * food.orderCount));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${order.room} - ${order.tableNo}'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: order.foods.length,
            itemBuilder: (context, index) {
              return Text(
                  '${order.foods[index].title} - ${order.foods[index].orderCount} шт. - ${order.foods[index].cost} KZT');
            },
          ),
          Text('$orderCost KZT'),
        ],
      ),
    );
  }
}
