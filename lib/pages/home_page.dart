import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //     size: 30,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/login');
        //   },
        // ),
        actions: [
          Container(
            padding: EdgeInsets.all(15),
            child: FaIcon(FontAwesomeIcons.bell, size: 30),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Navigation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Orders'),
              onTap: () {
                Navigator.of(context).pushNamed('/orders');
              },
              subtitle: Text('Orders Page'),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
              },
              subtitle: Text('Login Page'),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 0),
        child: ListView(
          children: [
            Text(
              'Hello,',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff888888),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Andrew Micky',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(height: 30),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search Restaurant, Cousine',
              ),
            ),
            Container(height: 20),
            Text(
              'Best Matches',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("Popular Cuisine",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Image(image: AssetImage('assets/burger.png')),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: Center(
                  child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text('Login Now'),
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
}
