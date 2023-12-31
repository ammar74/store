import 'package:flutter/material.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/screens/loading_screen.dart';
import 'package:store/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => const HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
        LoadingScreen.id : (context) => const LoadingScreen(),
      },
      initialRoute: HomePage.id,
    );
  }
}

