import "package:flutter/material.dart";
import "quantity_controller.dart";
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Order extends StatefulWidget {
  final String foodName;
  final double unitPrice;
  final int stars;
  final int quantity;

  Order(
      {Key key,
      @required this.foodName,
      @required this.unitPrice,
      @required this.stars,
      @required this.quantity})
      : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int _quantity;
  double _totalPrice;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
    _totalPrice = _quantity * widget.unitPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 70,
        maxHeight: 85,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              spreadRadius: 4,
              blurRadius: 9,
              offset: Offset(0, 9),
            ),
          ]),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 90,
            child: Image(image: AssetImage('assets/pizza.png')),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      widget.foodName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r'$' + "${_totalPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                child: SmoothStarRating(
                                    allowHalfRating: false,
                                    onRated: (v) {},
                                    starCount: 5,
                                    rating: widget.stars.toDouble(),
                                    size: 20.0,
                                    isReadOnly: false,
                                    color: Color(0xffFFC31F),
                                    borderColor: Color(0xffFFC31F),
                                    spacing: 0.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: QuantityController(
                          onChanged: (v) {
                            handleQuantityChange(v);
                          },
                          quantity: _quantity,
                          stock: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // padding: EdgeInsets.all(5),
    );
  }

  void handleQuantityChange(int newQ) {
    setState(() {
      _totalPrice = widget.unitPrice * newQ;
    });
  }
}
