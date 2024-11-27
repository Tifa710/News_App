import 'package:flutter/material.dart';
import 'package:untitled19/CategoryDM.dart';

import 'MyTheme.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDM;
  int index;
  CategoryItem({required this.categoryDM, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: categoryDM.color,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
              bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0))),
      child: Column(
        children: [
          Image.asset(categoryDM.imagePathe,height: MediaQuery.of(context).size.height*0.15,),
          Text(
            categoryDM.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: MyTheme.whiteColor),
          )
        ],
      ),
    );
  }
}
