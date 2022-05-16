import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/subcategory_model.dart';

class SubCategoriesScreen extends StatefulWidget {
  static const routeName = '/sub-categories';
  final List<Category> items;
  var index;

  SubCategoriesScreen(this.items, this.index);

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  String selectedSub = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SubCategories: ${widget.items[widget.index].name}'),
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
                'Sub-Categories',
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
                    itemCount: widget.items[widget.index].subCategories?.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: widget.items[widget.index]
                                  .subCategories?[index].selected,
                              onChanged: (val) {
                                setState(() {
                                  widget.items[widget.index]
                                      .subCategories?[index].selected = val!;
                                });
                              },
                            ),
                            Text(
                              widget.items[widget.index].subCategories?[index]
                                  .name as String,
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
                  setState(() {
                    // Navigator.of(context).popUntil(
                    //     ModalRoute.withName(Navigator.defaultRouteName));

                    Navigator.of(context).pop(widget.items);
                  });
                },
                color: Theme.of(context).accentColor,
                child: Text(
                  'Apply sub-categories',
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
