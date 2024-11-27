import 'package:flutter/material.dart';
import 'package:untitled19/Deatails.dart';
import 'package:untitled19/MyTheme.dart';

import 'NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;
  @override
  NewsItem({required this.news});
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            news.urlToImage ?? '',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(news.author ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 14, color: MyTheme.greyColor)),
        SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: (){
              Navigator.pushNamed(context, Details.routeName,arguments:NewsItem(news: news));
            },
            child: Text(news.title ?? '', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.greyColor))),
        SizedBox(
          height: 10,
        ),
        Text(
          news.publishedAt ?? '',
          textAlign: TextAlign.end,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 14, color: MyTheme.greyColor),
        )
      ],
    );
  }
}
