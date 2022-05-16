import 'package:flutter/material.dart';

import '../screens/main_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/sub_categories_screen.dart';

import './models/category_model.dart';
import './models/subcategory_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Category> _displayValues = [
    Category(
      name: 'Fruits',
      subCategories: [
        SubCategory(name: 'Apple'),
        SubCategory(name: 'Banana'),
        SubCategory(name: 'Kiwi'),
      ],
    ),
    Category(
      name: 'Vegetables',
      subCategories: [
        SubCategory(name: 'Cucumber'),
        SubCategory(name: 'Lettuce'),
        SubCategory(name: 'Onion'),
      ],
    ),
    Category(
      name: 'Milk',
      subCategories: [
        SubCategory(name: 'Simple'),
        SubCategory(name: 'Almond'),
        SubCategory(name: 'Chocolate'),
      ],
    ),
  ];

  var _index = 0;

  void _updateSelectedIndex(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ex Multiple Screens',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        errorColor: Colors.redAccent,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText2:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              bodyText1: TextStyle(color: Colors.black),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MainScreen(_displayValues),
        CategoriesScreen.routeName: (ctx) =>
            CategoriesScreen(_displayValues, _updateSelectedIndex),
        SubCategoriesScreen.routeName: (ctx) =>
            SubCategoriesScreen(_displayValues, _index),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => CategoriesScreen(_displayValues, _updateSelectedIndex),
      ),
    );
  }
}
