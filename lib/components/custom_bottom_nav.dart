import "package:flutter/material.dart";

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}
