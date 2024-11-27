import 'package:flutter/material.dart';
import 'package:untitled19/api_manger.dart';
import 'package:untitled19/model/sourceRespones.dart';
import 'newsItem.dart';

class NewsContainer extends StatefulWidget{
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManger.getNewsBySourceID(widget.source.id!)
        , builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        }
      else if(snapshot.hasError)
        {
          return Column(
            children: [
               Text('SomeThing Went Wrong'),
              ElevatedButton(onPressed: (){
                ApiManger.getNewsBySourceID(widget.source.id!);
                setState(() {
                });
              }, child: Text('Try Again please'))
            ],
          );
        }
      if(snapshot.data?.status!='ok'){
        return Column(
          children: [
            Text(snapshot.data?.message??'SomeThing Went Wrong'),
            ElevatedButton(onPressed: (){
              ApiManger.getNewsBySourceID(widget.source.id!);
              setState(() {
              });
            }, child: Text('Try Again'))
          ],
        );
      }
      var newList= snapshot.data?.articles??=[];
      return Expanded(
        child: ListView.builder(itemBuilder: (context,index){
          return NewsItem(news: newList![index]);
        },
        itemCount: newList?.length,),
      );
        });
  }
}