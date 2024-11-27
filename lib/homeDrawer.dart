import 'package:flutter/material.dart';

import 'MyTheme.dart';

class HomeDrawer extends StatelessWidget{
  Function onSideMenuItem;
  static const int category = 1;
  static const int setting = 2;

  HomeDrawer({required this.onSideMenuItem});
  @override
  Widget build(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Container(width:double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
          color: MyTheme.primaryLightColor,
          child: Text('News App',style:Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.whiteColor),textAlign: TextAlign.center,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuItem(HomeDrawer.category);
            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text('Category',style:Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black))
        ]),
          )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    onSideMenuItem(HomeDrawer.setting);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 10,),
                      Text('Setting',style:Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black))],
                    ),
                ),
              ),
  ]));
  }
}
