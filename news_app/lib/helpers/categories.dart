import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  String name;
  FaIcon icon;

  Category(this.name, this.icon);
}

class Categories with ChangeNotifier {
  List<Category> categories = [];
  String categoriaActual = "General";
  Category category1 =
      new Category("general", FaIcon(FontAwesomeIcons.newspaper));
  Category category2 = new Category("health", FaIcon(FontAwesomeIcons.heart));
  Category category3 =
      new Category("science", FaIcon(FontAwesomeIcons.battleNet));
  Category category4 = new Category("sports", FaIcon(FontAwesomeIcons.futbol));
  Category category5 =
      new Category("technology", FaIcon(FontAwesomeIcons.brain));
  Category category6 =
      new Category("business", FaIcon(FontAwesomeIcons.businessTime));
  Category category7 =
      new Category("entertainment", FaIcon(FontAwesomeIcons.tv));
  Categories() {
    addCategories();
  }

  addCategories() {
    categories.add(category1);
    categories.add(category2);
    categories.add(category3);
    categories.add(category4);
    categories.add(category5);
    categories.add(category6);
    categories.add(category7);
    notifyListeners();
  }

  changeCategory(String category) {
    categories.forEach((opt) {
      if (opt.name == category) {
        categoriaActual = category;
      }
    });

    notifyListeners();
  }

  // get catergories => _categories;
}
