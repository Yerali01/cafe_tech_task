import 'package:cafe_sqlite/core/entities/food.dart';
import 'package:cafe_sqlite/core/entities/order.dart';
import 'package:rxdart/rxdart.dart';

class Database {
  final BehaviorSubject<List<Order>> cafeOrdersSubject =
      BehaviorSubject<List<Order>>();

  Database() {
    // Initialize with empty list
    cafeOrdersSubject.add([]);
  }

  void addToOrders(Order order) {
    final currentOrders = cafeOrdersSubject.value ?? [];
    final updatedOrders = [...currentOrders, order];
    cafeOrdersSubject.add(updatedOrders);
  }

  List<Order> getAllOrders() {
    return cafeOrdersSubject.value ?? [];
  }

  List<Food> getFood() {
    List<Food> foods = [
      Food(
        id: 1,
        title: 'Cola',
        cost: 500,
        count: 800,
        type: 'drink',
        orderCount: 0,
      ),
      Food(
        id: 2,
        title: 'Fanta',
        cost: 500,
        count: 700,
        type: 'drink',
        orderCount: 0,
      ),
      Food(
        id: 3,
        title: 'Sprite',
        cost: 460,
        count: 600,
        type: 'drink',
        orderCount: 0,
      ),
      Food(
        id: 4,
        title: 'Pepsi',
        cost: 450,
        count: 550,
        type: 'drink',
        orderCount: 0,
      ),
      Food(
        id: 5,
        title: 'Merinda',
        cost: 450,
        count: 600,
        type: 'drink',
        orderCount: 0,
      ),
      Food(
        id: 6,
        title: 'sup',
        cost: 2500,
        count: 75,
        type: 'first',
        orderCount: 0,
      ),
      Food(
        id: 7,
        title: 'sup 2',
        cost: 1500,
        count: 80,
        type: 'first',
        orderCount: 0,
      ),
      Food(
        id: 8,
        title: 'sup 3',
        cost: 2000,
        count: 50,
        type: 'first',
        orderCount: 0,
      ),
      Food(
        id: 9,
        title: 'main sup 85',
        cost: 5000,
        count: 100,
        type: 'first',
        orderCount: 0,
      ),
      Food(
        id: 10,
        title: 'black caviar sup',
        cost: 2500,
        count: 200,
        type: 'first',
        orderCount: 0,
      ),
      Food(
        id: 11,
        title: 'bread',
        cost: 7000,
        count: 700,
        type: 'second',
        orderCount: 0,
      ),
      Food(
        id: 12,
        title: 'rice and fish',
        cost: 1500,
        count: 500,
        type: 'second',
        orderCount: 0,
      ),
      Food(
        id: 13,
        title: 'lasagna',
        cost: 3000,
        count: 600,
        type: 'second',
        orderCount: 0,
      ),
      Food(
        id: 14,
        title: 'pasta',
        cost: 2500,
        count: 25,
        type: 'second',
        orderCount: 0,
      ),
      Food(
        id: 15,
        title: 'curry',
        cost: 5000,
        count: 15,
        type: 'second',
        orderCount: 0,
      ),
    ];
    return foods;
  }
}
