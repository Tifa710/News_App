import 'package:flutter/material.dart';
import 'package:untitled19/CategoryDM.dart';
import 'package:untitled19/Deatails.dart';
import 'package:untitled19/MyTheme.dart';
import 'package:untitled19/newsItem.dart';
import 'package:untitled19/setting.dart';

import 'HomeScreen.dart';
import 'category_detailes.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
        CategoryDetails.routeName:(context)=> CategoryDetails(),
        Setting.routeName:(context)=>Setting(),
        Details.routeName:(context)=> Details()
      },
      theme: MyTheme.ligthTheme,
    );
  }
}