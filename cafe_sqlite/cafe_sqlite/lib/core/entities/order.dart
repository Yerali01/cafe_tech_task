import 'package:cafe_sqlite/core/entities/food.dart';

class Order {
  final String id;
  final String room;
  final int tableNo;
  final List<Food> foods;

  Order({
    required this.id,
    required this.room,
    required this.tableNo,
    required this.foods,
  });

  @override
  String toString() {
    return 'Order{id: $id, $room: , $tableNo: $foods }';
  }

  // factory Order.fromSQFliteDatabase(Map<String, dynamic> map) => Order(
  //       id: map['id'] ?? 0,
  //       room: map['room'] ?? '',
  //       tableNo: map['tableNo'] ?? 0,
  //       foods: map['foods'] ?? "",
  //     );
}
