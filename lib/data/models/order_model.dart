import '../constants/api_constants.dart';
import 'item_model.dart';

class Order {
  final String id;
  final String status;
  final String totalPrice;
  final String shopName;
  final String date;
  final String notes;
  final String subTotalPrice;
  final double taxes;
  final List<Item> items;

  Order({
    required this.shopName,
    required this.date,
    required this.notes,
    required this.subTotalPrice,
    required this.taxes,
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.items,
  });

  /// TODO: data - compelte the rest of the fields
  factory Order.fromMap(Map<String, dynamic> map) {
    final totalPrice = map[ApiConstants.orderTotal] as String;
    return Order(
      id: map[ApiConstants.orderNumber] as String,
      status: map[ApiConstants.orderStatus] as String,
      date: map[ApiConstants.orderDate] as String,
      shopName: 'Carrefour Market',
      notes: 'There is no notes',
      taxes: 0,
      subTotalPrice: totalPrice,
      totalPrice: totalPrice,
      items: (map[ApiConstants.orderItems] as List)
          .map((item) => Item.fromMap(item))
          .toList(),
    );
  }
}
