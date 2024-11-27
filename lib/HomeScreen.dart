import 'package:flutter/material.dart';
import 'package:untitled19/CategoryDM.dart';
import 'package:untitled19/MyTheme.dart';
import 'package:untitled19/category_detailes.dart';
import 'package:untitled19/setting.dart';
import 'CategoryFragment.dart';
import 'homeDrawer.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          currentSelected == HomeDrawer.setting
              ? 'Setting'
              : selectedCategory == null
              ? 'News App'
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: TitleSearch(),
              );
              setState(() {});
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      drawer: Drawer(
        child: HomeDrawer(
          onSideMenuItem: selectedMenuItem,
        ),
      ),
      body: currentSelected == HomeDrawer.setting
          ? Setting()
          : selectedCategory == null
          ? CategoryFragment(onCategorySelect: onCategorySelect)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  CategoryDM? selectedCategory;
  void onCategorySelect(CategoryDM newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int currentSelected = HomeDrawer.category;
  void selectedMenuItem(int newItemMenuSelect) {
    currentSelected = newItemMenuSelect;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

class TitleSearch extends SearchDelegate {
  List<CategoryDM> catList = CategoryDM.getCategoryList();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      hintColor: MyTheme.greyColor,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: MyTheme.greyColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return selectedCategory != null
        ? CategoryDetails(category: selectedCategory!)
        : Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CategoryDM> suggestions = query.isEmpty
        ? catList
        : catList
        .where(
          (category) =>
          category.title.toLowerCase().contains(query.toLowerCase()),
    )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final category = suggestions[index];
        return ListTile(
          title: Text(
            category.title,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: MyTheme.greyColor),
          ),
          onTap: () {
            query = category.title;
            selectedCategory = category;
            showResults (context);
          },
        );
      },
      itemCount: suggestions.length,
    );
  }

  CategoryDM? selectedCategory;

  void onCategorySelect(CategoryDM newCategory) {
    selectedCategory = newCategory;
  }
}