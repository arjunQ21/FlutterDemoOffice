import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  // color: Color(0xffff0000),
                  image:
                      DecorationImage(image: AssetImage('assets/burger.png')),
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
            ),
            getText('Username'),
            getText('Email'),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color(0xffFF7C2A),
                gradient: LinearGradient(
                    colors: [Color(0xffFF7C2A), Color(0xffFFAC0E)]),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Forgot Password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Create Account',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff0000ff)),
                    ),
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
    );
  }

  Widget getText(String name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Your $name here',
          labelText: name,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
