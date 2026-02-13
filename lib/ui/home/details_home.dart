import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/models/categoryModel.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/ui/home/widgets/articleList.dart';

class DetailsHome extends StatelessWidget {
  CategoryModel categoryModel ;
  DetailsHome( this.categoryModel);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSource(categoryModel.id),
        builder: (context , snapshot ){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            Center(child: Icon(Icons.error_outline , size: 60.sp , color:  ColorsManager.red,),) ;
          }
          var sources = snapshot.data?.sources?? [];
          return Padding(
            padding: REdgeInsets.all(8.0),
            child: DefaultTabController(
              length: 10,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                    labelStyle: Theme.of(context).textTheme.headlineSmall,
                    unselectedLabelStyle: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.copyWith(fontSize: 14.sp),
                    tabs: sources.map((source) => Tab(text: source.name)).toList(),
                  ),
                  SizedBox(height: 18.h,) ,
                  Expanded(
                    child: TabBarView(
                        children: sources.map((source)=> Articlelist()).toList()
                    ),
                  ),
                ],
              ),
            ),
          );

        }

    );
  }
}
