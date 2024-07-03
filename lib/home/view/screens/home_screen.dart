import 'package:flutter/material.dart';
import 'package:news_app/category/view/widgets/category_grid.dart';
import 'package:news_app/category/data/models/category_model.dart';
import 'package:news_app/settings/view/widgets/settings_tab.dart';
import '../../../category/view/widgets/category_details.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/background.png"),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory != null
              ? selectedCategory!.title
              : selctedDrawerItem == DrawerItems.categories
                  ? "News App"
                  : "Settings"),
          toolbarHeight: 65,
        ),
        body: selectedCategory != null
            ? CategoryDetails(
                categoryId: selectedCategory!.id,
              )
            : selctedDrawerItem == DrawerItems.categories
                ? CategoryGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : SettingsTab(),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
      ),
    );
  }

  var selctedDrawerItem = DrawerItems.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItems selctedItem) {
    selctedDrawerItem = selctedItem;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
// var aaa = DrawerItems.categories;
