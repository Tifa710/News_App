import 'package:flutter/material.dart';
import 'package:untitled19/MyTheme.dart';
import 'package:untitled19/model/sourceRespones.dart';

class Tap_Item extends StatelessWidget {
  Source source;
  bool isSelected;
  Tap_Item({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 3, color: Theme.of(context).primaryColor),
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,),
        child: Text(
          source.name ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith( color:
          isSelected ? MyTheme.whiteColor : MyTheme.primaryLightColor),
        ),
      ),
    );
    }
}
