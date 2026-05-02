import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/search/widgets/custom_search_bar.dart';
import 'package:news/ui/search/widgets/search_state.dart';
import '../home/widgets/articleItem.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 80.h,
            title: const CustomSearchBar(),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: BlocBuilder<Search, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 60.sp,
                            color: Theme.of(context).colorScheme.error,
                          ),

                          SizedBox(height: 10.h),

                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),

                          SizedBox(height: 20.h),

                          ElevatedButton(
                            onPressed: () {
                              context.read<Search>().reset();
                            },
                            child: const Text("Try Again"),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is SearchSuccess) {
                    if (state.articles.isEmpty) {
                      return const Center(child: Text("No results found"));
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.articles.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        return ArticleItem(state.articles[index]);
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
