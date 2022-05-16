import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../models/category_model.dart';
import '../models/subcategory_model.dart';

class MainScreen extends StatefulWidget {
  final List<Category> displayValues;

  MainScreen(this.displayValues);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _received = '';

  void _updateReceived(List<Category> list) {
    setState(() {
      List<SubCategory> subs = [];

      for (var i = 0; i < list.length; i++) {
        if (list[i].selected) {
          _received = list[i].name.toString();
          subs = list[i].subCategories!;
          break;
        }
      }

      print(subs);
      _received += ': ';
      // String subCategories = subs.map((subCat) {
      //   if (subCat.selected) return '${subCat.name}';
      // }).join(', ');
      String subCategories = '';
      for (var i = 0; i < subs.length; i++) {
        if (subs[i].selected) {
          subCategories += subs[i].name as String;
          subCategories += ' ';
        }
      }
      _received += subCategories;
    });
  }

  void _execute() {
    Navigator.of(context).pushNamed(CategoriesScreen.routeName).then((val) {
      _updateReceived(widget.displayValues);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
            ),
            RaisedButton(
              child: Text(
                'Open categories',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              onPressed: () {
                // Navigator.of(context).pushNamed(CategoriesScreen.routeName);
                _execute();
              },
              color: Theme.of(context).accentColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Selected info:',
              style: Theme.of(context).textTheme.headline6,
            ),
            _received.isEmpty
                ? Text(
                    'Nothing yet!',
                    style: TextStyle(color: Theme.of(context).errorColor),
                  )
                : Text(
                    '${_received}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
          ],
        ),
      ),
    );
  }
}
