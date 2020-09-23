import 'package:flutter/material.dart';

class QuantityController extends StatefulWidget {
  final int quantity;
  final int stock;
  final Function onChanged;

  QuantityController(
      {Key key, @required this.onChanged, this.quantity = 1, this.stock = 5})
      : super(key: key);

  @override
  _QuantityControllerState createState() => _QuantityControllerState();
}

class _QuantityControllerState extends State<QuantityController> {
  int _quantity;
  int _stock;
  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
    _stock = widget.stock;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.green,
    );
    return Container(
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: Text(
              '-',
              style: buttonTextStyle,
            ),
            onTap: () {
              if (_quantity > 1) {
                _quantity--;
                widget.onChanged(_quantity);
                setState(() {});
              } else {
                debugPrint("Cant reduce than this.");
              }
            },
          ),
          Text(_quantity.toString(), style: buttonTextStyle),
          GestureDetector(
            child: Text(
              '+',
              style: buttonTextStyle,
            ),
            onTap: () {
              if (_quantity < _stock) {
                _quantity++;
                widget.onChanged(_quantity);
                setState(() {});
              } else {
                debugPrint("No more available.");
              }
            },
          ),
        ],
      ),
    );
  }
}
