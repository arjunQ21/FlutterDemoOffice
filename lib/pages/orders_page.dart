import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: FaIcon(FontAwesomeIcons.bell, size: 28),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                'Orders',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            getList('Paneer Pizza', 19.9, 1, 4),
            getList('Capsicum Pizza', 14.9, 2, 3),
            getList('Spicy Chicken Pizza', 24.9, 1, 4),
            // Container(height: 40),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Total:     ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  r'$74.5',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff888888),
                  ),
                ),
              ]),
            ),
            Container(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: OutlineButton(
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text('Apply Promo',
                              style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        onPressed: () {},
                        borderSide: BorderSide()),
                    // padding:
                  ),
                  Container(width: 20),
                  RaisedButton(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [Color(0xffFF7D2A), Color(0xffFFB409)]),
                      ),
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: Center(
                  child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(context);
                },
                child: Text('Go Back'),
              )),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          color: Color(0x11000000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.nature),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.note),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getList(String name, double price, int quantity, double stars) {
    TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.green,
    );
    return Container(
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
                      name,
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
                          // color: Colors.red,
                          // height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r'$' + "${price.toString()}",
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
                                      rating: stars,
                                      size: 20.0,
                                      isReadOnly: false,
                                      color: Color(0xffFFC31F),
                                      borderColor: Color(0xffFFC31F),
                                      spacing: 0.0)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          // color: Colors.red,
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
                              onTap: () {},
                            ),
                            Text(quantity.toString(), style: buttonTextStyle),
                            GestureDetector(
                              child: Text(
                                '+',
                                style: buttonTextStyle,
                              ),
                              onTap: () {
                                debugPrint('clicked plus');
                              },
                            ),
                          ],
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
}
