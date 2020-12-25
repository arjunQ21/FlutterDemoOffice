// import 'package:flutter/material.dart';
// import 'order.dart';

// class Orders extends StatefulWidget {
//   final List<Order> all;
//   Orders({Key key, this.all}) : super(key: key);
//   @override
//   _OrdersState createState() => _OrdersState();
// }

// class _OrdersState extends State<Orders> {
//   double _totalPrice = 0.0;
//   List<Order> _allOrders = List<Order>();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 20, bottom: 15),
//             child: Text(
//               'Orders',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Order(
//             foodName: 'Paneer Pizza',
//             unitPrice: 19.9,
//             quantity: 1,
//             stars: 4,
//           ),
//           Order(
//             foodName: 'Capsicum Pizza',
//             unitPrice: 14.9,
//             quantity: 2,
//             stars: 3,
//           ),
//           Order(
//             foodName: 'Spicy Chicken Pizza',
//             unitPrice: 24.9,
//             quantity: 1,
//             stars: 4,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//               Text(
//                 'Total:     ',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 r'$74.5',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff888888),
//                 ),
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
