import 'package:flutter/material.dart';
import 'package:untitled19/newsItem.dart';

import 'MyTheme.dart';

class Details extends StatelessWidget {
  static const String routeName = 'Details';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as NewsItem ;
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              args.news.urlToImage ?? '',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(args.news.author ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 14, color: MyTheme.greyColor)),
          SizedBox(
            height: 10,
          ),
          Text(args.news.title ?? '', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.greyColor)),
          SizedBox(
            height: 20,
          ),
          Text(
            args.news.description ?? '',
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: MyTheme.greyColor)
          )
    ]),
    );
  }
}
