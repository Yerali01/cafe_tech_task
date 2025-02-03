import 'package:cafe_sqlite/core/database.dart';
import 'package:cafe_sqlite/features/choose_table/presentation/choose_table.dart';
import 'package:flutter/material.dart';

class ChooseRoomScreen extends StatelessWidget {
  const ChooseRoomScreen({super.key, required this.db});
  final Database db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  context, ChooseTableScreen.root("Основной зал", db));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Основной зал",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, ChooseTableScreen.root("Летник", db));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Летник',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, ChooseTableScreen.root("VIP 1", db));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'VIP 1',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, ChooseTableScreen.root("VIP 2", db));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'VIP 2',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
