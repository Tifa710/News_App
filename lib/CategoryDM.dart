import 'dart:ui';

import 'package:untitled19/MyTheme.dart';

class CategoryDM {
  String id;
  String title;
  Color color;
  String imagePathe;
  CategoryDM({required this.id,required this.title,required this.color,required this.imagePathe});

  static List<CategoryDM> getCategoryList(){
    return[
    CategoryDM(id: 'sports', title: 'Sports', color: MyTheme.redColor, imagePathe:'assets/images/ball.png' ),
    CategoryDM(id: 'general', title: 'General', color: MyTheme.darkBlueColor, imagePathe: 'assets/images/environment.png'),
    CategoryDM(id: 'health', title: 'Health', color: MyTheme.pinkColor, imagePathe: 'assets/images/health.png'),
    CategoryDM(id: 'business', title: 'Business', color: MyTheme.brownColor, imagePathe:'assets/images/bussines.png' ),
    CategoryDM(id: 'entertainment', title: 'Entertanment', color: MyTheme.blurColor, imagePathe: 'assets/images/environment.png'),
    CategoryDM(id: 'science', title: 'Scince', color: MyTheme.yellowClor, imagePathe:'assets/images/science.png'),
    CategoryDM(id: 'technology', title: 'Technology', color: MyTheme.blurColor, imagePathe: 'assets/images/science.png'),
    ];
  }
}
