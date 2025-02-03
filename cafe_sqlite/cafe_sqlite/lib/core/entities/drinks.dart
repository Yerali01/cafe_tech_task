// class Drinks {
//   final int id;
//   final String title;
//   final int cost;
//   final int count;

//   Drinks({
//     required this.id,
//     required this.title,
//     required this.cost,
//     required this.count,
//   });

//   factory Drinks.fromSQFliteDatabase(Map<String, dynamic> map) => Drinks(
//         id: map['id'].toInt() ?? 0,
//         title: map['title'] ?? '',
//         cost: map['cost'] ?? 0,
//         count: map['count'] ?? 0,
//       );

//   factory Drinks.fromJson(Map<String, dynamic> map) {
//     return Drinks(
//       id: map["id"] ?? 0,
//       title: map["title"] ?? "",
//       cost: map["cost"] ?? 0,
//       count: map["count"] ?? 0,
//     );
//   }
// }
