import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import "dart:convert" as convert;

class BackendPage extends StatefulWidget {
  final String host = 'http://192.168.1.69';
  @override
  _BackendPageState createState() => _BackendPageState();
}

class _BackendPageState extends State<BackendPage> {
  String _response = 'Http Response Here';
  List _foods = [
    {'name': 'First Local Food', 'quantity': 4},
    {'name': 'Second Local Food', 'quantity': 7}
  ];
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accessing Backend APIs', textAlign: TextAlign.center),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Insert new food data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Food Name',
                      ),
                      validator: (value) {
                        value = value.trim();
                        if (value.length < 5)
                          return 'Food name must have at least 5 characters.';
                        return null;
                      },
                    ),
                    Row(children: [
                      Expanded(
                        child: TextFormField(
                            controller: quantityController,
                            decoration: InputDecoration(
                              labelText: 'Price(Rs)',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              value = value.trim();
                              bool isNumeric = true;
                              try {
                                double.parse(value);
                              } catch (e) {
                                isNumeric = false;
                              }
                              if (!isNumeric) return "Numeric value expected.";
                              return null;
                            }),
                      ),
                      Container(width: 30),
                      RaisedButton(
                          child: Text('Add Food'),
                          onPressed: () {
                            _addFood();
                          }),
                    ]),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                child: Text('Fetch Foods'),
                onPressed: () {
                  setState(() {
                    _response = 'loading . . . . . . . . . .';
                  });
                  _fetchLists();
                },
              ),
            ),
            Divider(),
            Text(_response),
            buildFoods(),
          ],
        ),
      ),
    );
  }

  void _addFood() async {
    if (_formKey.currentState.validate()) {
      print("valid");
      setState(() {
        _response = 'adding new food.';
      });
      // 'http://10.0.2.2/food/add.php?name=${nameController.text}&quantity=${quantityController.text}'
      var response = await http.post('${widget.host}/food/add.php', body: {
        'name': nameController.text,
        'quantity': quantityController.text
      });
      if (response.statusCode == 200) {
        try {
          var jsonR = convert.jsonDecode(response.body);
          if (jsonR['isGood'] == true) {
            nameController.text = '';
            quantityController.text = '';
            setState(() {
              _response = 'Added Successfully';
            });
            _fetchLists();
          }
        } catch (e) {
          setState(() {
            _response = 'Error Occurred: ' + e.toString();
          });
        }
      }
    } else {
      setState(() {
        _response = 'invalid food data';
      });
    }
  }

  void _fetchLists() async {
    try {
      var response = await http.get('${widget.host}/food/lists.php');
      if (response.statusCode == 200) {
        var jsonR = convert.jsonDecode(response.body);
        if (jsonR['isGood'] == true) {
          setState(() {
            _foods = jsonR['foods'];
            _response = '';
          });
        }
      } else {
        setState(() {
          _response = 'Error loading foods from server.';
        });
      }
    } catch (e) {
      setState(() {
        _response = e.toString();
      });
    }
  }

  Widget buildFoods() {
    return Container(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _foods.map((f) {
          return Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0x11000000), blurRadius: 4, spreadRadius: 2),
              ],
              border: Border.all(
                color: Color(0x99999999),
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Text(
                  f['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "price: Rs. " + f['quantity'].toString(),
                  style: TextStyle(
                    color: Color(0xff999999),
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
