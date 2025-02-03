// import 'package:cafe_sqlite/core/database/cafe_db.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseServices {
//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }

//     _database = await _initialize();
//     return _database!;
//   }

//   Future<String> get fullPath async {
//     const cafeDB = "cafe.db";
//     final path = await getDatabasesPath();
//     return join(path, cafeDB);
//   }

//   Future<Database> _initialize() async {
//     final path = await fullPath;
//     var database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: create,
//       singleInstance: true,
//     );
//     return database;
//   }

//   Future<void> create(Database database, int version) async {
//     // await CafeDB().createOdersTable(database, "orders");
//     await CafeDB().createFoodsDrinksTable(database, "foods");
//     await CafeDB().createFoodsDrinksTable(database, "drinks");
//   }
// }
