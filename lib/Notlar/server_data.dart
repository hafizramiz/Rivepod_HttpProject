// abstract class ServerData {
//   final String id;
//   final String type;
//
//   ServerData({required this.id, required this.type});
//
//   factory ServerData.fromJson(Map<String, dynamic> json) {
//     final id = json['id'] as String;
//     final type = json['type'] as String;
//
//     switch (type) {
//       case 'product':
//         return Product.fromJson(json);
//       case 'user':
//         return User.fromJson(json);
//       case 'order':
//         return Order.fromJson(json);
//     // Add more cases for other data types
//       default:
//         throw Exception('Unknown data type: $type');
//     }
//   }
// }


// Dart
// class Product extends ServerData {
//   final String name;
//   final double price;
//
//   Product({
//     required String id,
//     required String type,
//     required this.name,
//     required this.price,
//   }) : super(id: id, type: type);
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json['id'] as String,
//     type: json['type'] as String,
//     name: json['name'] as String,
//     price: json['price'] as double,
//   );
// }
//
// class User extends ServerData {
//   final String name;
//   final String email;
//
//   User({
//     required String id,
//     required String type,
//     required this.name,
//     required this.email,
//   }) : super(id: id, type: type);
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json['id'] as String,
//     type: json['type'] as String,
//     name: json['name'] as String,
//     email: json['email'] as String,
//   );
// }
// Dart
// Future<List<ServerData>> fetchData() async {
//   try {
//     final response = await http.get(Uri.parse('https://your-api.com/data'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body) as List<dynamic>;
//       return data.map((json) => ServerData.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch data: ${response.statusCode}');
//     }
//   } catch (error) {
//     rethrow; // Rethrow the error for proper handling
//   }
// }
//
// Dart
// Widget build(BuildContext context) {
//   return FutureBuilder<List<ServerData>>(
//       future: fetchData(),
//   builder: (context, snapshot) {
//   if (snapshot.hasError) {
//   return Center(child: Text('Error: ${snapshot.error}'));
//   }
//
//   if (!snapshot.hasData) {
//   return Center(child: CircularProgressIndicator());
//   }
//
//   final data = snapshot.data!;
