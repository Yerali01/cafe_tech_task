import 'dart:async';

import 'package:cafe_sqlite/core/database.dart';
import 'package:cafe_sqlite/core/entities/order.dart';
import 'package:cafe_sqlite/features/my_orders/presentation/order_row.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({super.key, required this.db});
  final Database db;

  @override
  State<MyOrdersScreen> createState() => MyOrdersScreenState();
}

class MyOrdersScreenState extends State<MyOrdersScreen> {
  List<Order> cafeOrders = [];
  late StreamSubscription<List<Order>> _ordersSubscription;

  @override
  void initState() {
    super.initState();
    fetchMyOrders();
  }

  @override
  void dispose() {
    _ordersSubscription.cancel();
    super.dispose();
  }

  void fetchMyOrders() {
    cafeOrders = widget.db.getAllOrders();
    setState(() {});

    _ordersSubscription = widget.db.cafeOrdersSubject.listen((orders) {
      if (mounted) {
        setState(() {
          cafeOrders = orders;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My orders'),
        centerTitle: true,
      ),
      body: cafeOrders.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text('Заказов нет'),
                ),
                TextButton(
                  onPressed: () {
                    fetchMyOrders();
                  },
                  child: const Text('Попробуйте обновить'),
                ),
              ],
            )
          : ListView.builder(
              itemCount: cafeOrders.length,
              itemBuilder: (context, index) {
                return OrderRow(order: cafeOrders[index]);
              },
            ),
    );
  }
}
