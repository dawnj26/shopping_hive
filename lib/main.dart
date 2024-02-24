import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quinto_assignment3/box/shoppingBox.dart';
import 'package:quinto_assignment3/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();

  shoppingBox = await Hive.openBox('shopping');
  runApp(const ShoppingHive());
}

class ShoppingHive extends StatelessWidget {
  const ShoppingHive({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
