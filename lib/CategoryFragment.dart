import 'package:flutter/material.dart';
import 'package:untitled19/CategoryItem.dart';

import 'CategoryDM.dart';

class CategoryFragment extends StatelessWidget{
  Function onCategorySelect;
  CategoryFragment({required this.onCategorySelect});
  var listcategory  = CategoryDM.getCategoryList();
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
           child: Text('Pick your category \n of interst',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black),),
         ),
       SizedBox(height: 15,),
       Expanded(
         child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           crossAxisSpacing: 15,
           mainAxisSpacing: 15,
         ), itemBuilder: (context,index){
           return Container(
             child: InkWell(
                 onTap: (){
                   onCategorySelect(listcategory[index]);
                 },
                 child: CategoryItem(categoryDM:listcategory[index],index: index))
           );
         },itemCount: listcategory.length,),
       )],
     ),
   );
  }

}