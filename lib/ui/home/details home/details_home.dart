import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/DI/di.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/ui/home/details%20home/viewModel/detailsScreenViewModel.dart';
import 'package:news/ui/home/widgets/articleList.dart';
import '../../../core/Data/models/categoryModel.dart';

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
      create: (context)=>getIt.get<DetailsScreenViewModel>(),
      child: BlocBuilder<DetailsScreenViewModel , DetailsScreenState > (
          builder: (context, state ) {
            var viewModel = BlocProvider.of<DetailsScreenViewModel>(context);
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
            }
            if(state is ErrorState){
              return Column(
                children: [
                  Text(state.errorMessage.tr() , style: Theme.of(context).textTheme.headlineSmall,),
                  ElevatedButton(
                      onPressed: (){
                        viewModel.getSources(widget.categoryModel.id);
                      },
                      child: Text(TextManager.tryAgain.tr() , style: Theme.of(context).textTheme.headlineSmall,)
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator(),);
            }




      ),
    );
  }
}

