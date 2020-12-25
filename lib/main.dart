import "package:flutter/material.dart";
import "pages/home_page.dart";
import "pages/login_page.dart";
import "pages/orders_page.dart";
import "pages/backend_access.dart";
import "pages/local_storage.dart";

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
      '/local': (context) {
        return LocalStoragePage();
      },
      '/backend': (context) {
        return BackendPage();
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
