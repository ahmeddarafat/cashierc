import 'package:start_app/data/data_source/remote/api_constants.dart';

class OrderModel {
  final String number;
  final String status;
  final String totalPrice;
  final List<OrderItem> items;

  OrderModel({
    required this.number,
    required this.status,
    required this.totalPrice,
    required this.items,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      number: map[ApiConstants.orderNumber] as String,
      status: map[ApiConstants.orderStatus] as String,
      totalPrice: map[ApiConstants.orderTotal] as String,
      items: (map[ApiConstants.orderItems] as List)
          .map((item) => OrderItem.fromMap(item))
          .toList(),
    );
  }
}

class OrderItem {
  final String name;
  final String image;
  final int quantity;
  final String unitPrice;
  late final double totalPrice;

  OrderItem({
    required this.name,
    required this.image,
    required this.quantity,
    required this.unitPrice,
  }){
    totalPrice = quantity * double.parse(unitPrice);
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      name: map[ApiConstants.productName] as String,
      image: map[ApiConstants.productImage] as String,
      quantity: map[ApiConstants.quantity] as int,
      unitPrice: map[ApiConstants.unitPrice] as String,
    );
  }
}
