// import 'package:cafe_sqlite/core/entities/drinks.dart';
// import 'package:cafe_sqlite/core/entities/food.dart';
// import 'package:cafe_sqlite/core/entities/order.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:cafe_sqlite/core/database/database_services.dart';

// class CafeDB {
//   final ordersTable = "orders";
//   final foodsTable = "foods";
//   final drinksTable = "drinks";

//   Future<void> createOdersTable(Database database, String tableName) async {
//     // await database.execute("""
//     //   CREATE TABLE IF NOT EXISTS $tableName (
//     //     "id" INTEGER NOT NULL,
//     //     "room" TEXT NOT NULL,
//     //     "tableNo" INTEGER NOT NULL,
//     //     "foods" TEXT NOT NULL,
//     //     "count" INTEGER NOT NULL,
//     //     PRIMARY KEY ("id" AUTOINCREMENT)

//     //   );
//     //   """);
//     await database.execute("""
//       CREATE TABLE IF NOT EXISTS $tableName (
//         "id" INTEGER NOT NULL,
//         "room" TEXT NOT NULL,
//         "tableNo" INTEGER NOT NULL,
//         "foods" TEXT NOT NULL,
//         PRIMARY KEY ("id" AUTOINCREMENT)
//       );
//       """);
//   }

//   Future<void> createFoodsDrinksTable(
//       Database database, String tableName) async {
//     await database.execute("""
//       CREATE TABLE IF NOT EXISTS $tableName (
//         "id" INTEGER NOT NULL,
//         "title" TEXT NOT NULL,
//         "cost" INTEGER NOT NULL,
//         PRIMARY KEY ("id" AUTOINCREMENT)
//       );
//       """);
//   }

//   Future<int> insertIntoFoodsDrinks({
//     required String tableName,
//     required int id,
//     required String title,
//     required int cost,
//   }) async {
//     final database = await DatabaseServices().database;
//     return await database.rawInsert(
//       '''INSERT INTO $tableName (id, title, cost) VALUES (?, ?, ?) ''',
//       [id, title, cost],
//     );
//   }

//   Future<List<Food>> fetchAllFoods() async {
//     final database = await DatabaseServices().database;
//     final foods = await database.rawQuery('''SELECT * FROM $foodsTable''');
//     return foods.map((food) => Food.fromSQFliteDatabase(food)).toList();
//   }

//   Future<List<Drinks>> fetchAllDrinks() async {
//     final database = await DatabaseServices().database;
//     final drinks = await database.rawQuery('''SELECT * FROM $drinksTable''');
//     return drinks.map((drink) => Drinks.fromSQFliteDatabase(drink)).toList();
//   }

//   Future<int> InsertIntoOrdersTable({
//     required String room,
//     required int tableNo,
//     required String foods,
//   }) async {
//     final database = await DatabaseServices().database;
//     return await database.rawInsert(
//       '''INSERT INTO $ordersTable (room, tableNo, foods) VALUES (?, ?, ?) ''',
//       [room, tableNo, foods],
//     );
//   }

//   Future<List<Order>> fetchAllOrders() async {
//     final database = await DatabaseServices().database;
//     final orders = await database.rawQuery('''SELECT * FROM $ordersTable''');
//     return orders.map((order) => Order.fromSQFliteDatabase(order)).toList();
//   }
// }
