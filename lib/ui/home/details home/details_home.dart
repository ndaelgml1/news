import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/models/categoryModel.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/ui/home/details%20home/viewModel/detailsScreenViewModel.dart';
import 'package:news/ui/home/widgets/articleList.dart';

class DetailsHome extends StatefulWidget {
  CategoryModel categoryModel ;
  DetailsHome( this.categoryModel);

  @override
  State<DetailsHome> createState() => _DetailsHomeState();
}

class _DetailsHomeState extends State<DetailsHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsScreenViewModel>(
      create: (context)=> DetailsScreenViewModel()..getSources(widget.categoryModel.id),
      child: BlocBuilder<DetailsScreenViewModel , ParentState > (
          builder: (context, state ) {
            if(state is ErrorState){
              return Column(
                children: [
                  Text(state.errorMessage , style: Theme.of(context).textTheme.headlineSmall,),
                  ElevatedButton(
                      onPressed: (){

                      },
                      child: Text(TextManager.tryAgain , style: Theme.of(context).textTheme.headlineSmall,)
                  ),
                ],
              );
            }
            if (state is SuccessState){
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
                        tabs: state.sources.map((source) => Tab(text: source.name)).toList(),
                      ),
                      SizedBox(height: 18.h,) ,
                      Expanded(
                        child: TabBarView(
                            children: state.sources.map((source) => Articlelist(source.id??"") ).toList()
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } ;
            return Center(child: CircularProgressIndicator(),);
            }




      ),
    );
  }
}

/* FutureBuilder(
        future: ApiManager.getSource(widget.categoryModel.id),
        builder: (context , snapshot ){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString() , style: Theme.of(context).textTheme.headlineSmall,) ,
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text(TextManager.tryAgain , style: Theme.of(context).textTheme.headlineSmall,)
                ),
              ],
            );
          }
          if(snapshot.data?.status=="error"){
            return Column(
              children: [
                Text(snapshot.data!.message! , style: Theme.of(context).textTheme.headlineSmall,),
                ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    child: Text(TextManager.tryAgain , style: Theme.of(context).textTheme.headlineSmall,)
                ),
              ],
            );
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

    );*/
