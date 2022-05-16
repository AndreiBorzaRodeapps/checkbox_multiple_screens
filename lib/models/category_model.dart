import '../models/subcategory_model.dart';
import 'package:flutter/foundation.dart';

class Category {
  String? name;
  List<SubCategory>? subCategories;
  bool selected;

  Category({@required this.name, this.subCategories, this.selected = false});
}
