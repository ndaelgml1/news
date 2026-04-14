import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/Data/dataSource_Impl/ArticlesApiDataSource_Impl.dart';
import 'package:news/core/Data/sourceRepoImpl/article_repo_impl.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/ui/home/details%20home/viewModel/articleviewModel.dart';
import 'package:news/ui/home/widgets/articleItem.dart';

class Articlelist extends StatefulWidget {
  Articlelist(this.sourceId);
  String sourceId;

  @override
  State<Articlelist> createState() => _ArticlelistState();
}

class _ArticlelistState extends State<Articlelist> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleViewModel(ArticleRepoImpl(ArticlesApiDataSourceImpl(ApiManager())))..getArticles(widget.sourceId),
      child: BlocBuilder<ArticleViewModel, ArticleState>(
        builder: (context, state) {
          if (state is ErrorState) {
            return Padding(
              padding: REdgeInsets.all(4),
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ArticleViewModel>(
                        context,
                      ).getArticles(widget.sourceId);
                    },
                    child: Text(
                      TextManager.tryAgain,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is SuccessState) {
            return ListView.separated(
              itemBuilder: (context, index) =>
                  ArticleItem(state.articles[index]),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: state.articles.length,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


