import "package:flutter/material.dart";
import "pages/home_page.dart";
import "pages/login_page.dart";
import "pages/orders_page.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.grey,
      accentColor: Colors.green,
      fontFamily: 'Poppins',
    ),
    routes: {
      '/': (context) {
        return HomePage();
      },
      '/login': (context) {
        return LoginPage();
      },
      '/orders': (context) {
        return OrdersPage();
      }
    },
  ));
}
