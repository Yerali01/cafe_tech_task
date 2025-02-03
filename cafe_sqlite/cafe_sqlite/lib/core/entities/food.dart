class Food {
  final int id;
  final String type;
  final String title;
  final int cost;
  final int count;
  int orderCount;

  Food({
    required this.id,
    required this.type,
    required this.title,
    required this.cost,
    required this.count,
    required this.orderCount,
  });

  Food copyWith({
    int? id,
    String? type,
    String? title,
    int? cost,
    int? count,
    int? orderCount,
  }) {
    return Food(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      cost: cost ?? this.cost,
      count: count ?? this.count,
      orderCount: orderCount ?? this.orderCount,
    );
  }
}
