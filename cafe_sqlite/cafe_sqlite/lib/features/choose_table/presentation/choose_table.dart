import 'package:cafe_sqlite/core/database.dart';
import 'package:cafe_sqlite/features/take_order/presentation/take_order_screen.dart';
import 'package:flutter/material.dart';

class ChooseTableScreen extends StatefulWidget {
  static root(String room, Database db) => MaterialPageRoute(
        builder: (context) => ChooseTableScreen(
          room: room,
          db: db,
        ),
      );
  final String room;
  final Database db;
  const ChooseTableScreen({
    super.key,
    required this.room,
    required this.db,
  });

  @override
  State<ChooseTableScreen> createState() => _ChooseTableScreenState();
}

class _ChooseTableScreenState extends State<ChooseTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, TakeOrderScreen.route(widget.room, 1, widget.db));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text("1"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, TakeOrderScreen.route(widget.room, 2, widget.db));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('2'),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, TakeOrderScreen.route(widget.room, 3, widget.db));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: Center(child: const Text('3')),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, TakeOrderScreen.route(widget.room, 4, widget.db));
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: Center(child: const Text('4')),
            ),
          ),
        ],
      ),
    );
  }
}
