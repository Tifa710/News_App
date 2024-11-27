import 'package:flutter/material.dart';
import 'package:untitled19/CategoryDM.dart';
import 'package:untitled19/api_manger.dart';
import 'package:untitled19/model/sourceRespones.dart';
import 'package:untitled19/tap_container.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName= 'Category';
  CategoryDM ?category;
  CategoryDetails({this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<SourceRespones>(
          future: ApiManger.getSource(widget.category!.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ));
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('something went wrong'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManger.getSource(widget.category!.id);
                      },
                      child: Text('Try Again'))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              Text(snapshot.data?.message ?? '');
              ElevatedButton(onPressed: () {
                ApiManger.getSource(widget.category!.id);
              }, child: Text('Try Again'));
            }
            var sourcList= snapshot.data?.sources??[];
            return Tap_container(sourceList: sourcList);
          })
    );
  }
}