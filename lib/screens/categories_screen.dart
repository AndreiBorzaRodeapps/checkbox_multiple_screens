import 'package:checkbox_multiple_screens/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories';
  List<Category> categories;
  Function updateIndex;

  CategoriesScreen(this.categories, this.updateIndex);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 300,
                child: Card(
                  elevation: 8,
                  child: ListView.builder(
                    itemCount: widget.categories.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              onChanged: (val) {
                                setState(() {
                                  for (var i = 0;
                                      i < widget.categories.length;
                                      i++) {
                                    if (i != index) {
                                      if (widget.categories[i].selected ==
                                          true) {
                                        widget.categories[i].selected = false;
                                      }
                                    }
                                  }
                                  widget.updateIndex(index);
                                  widget.categories[index].selected = val!;
                                });
                              },
                              value: widget.categories[index].selected,
                            ),
                            Text(
                              widget.categories[index].name as String,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(SubCategoriesScreen.routeName)
                      .then((value) => Navigator.of(context).pop());
                },
                color: Theme.of(context).accentColor,
                child: Text(
                  'Apply categories',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
