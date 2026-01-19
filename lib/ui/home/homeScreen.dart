import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/models/categoryModel.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/core/widgets/categoryItem.dart';
import 'package:news/core/widgets/drawer.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: CustomDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          TextManager.home ,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: Padding(
        padding: REdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                TextManager.welcomeText,
              style: TextTheme.of(context).headlineMedium!.copyWith(fontSize: 24),

            ),
            SizedBox(height: 14.h,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context , index )=> CategoryItem(
                      index: index,
                      categoryModel:CategoryModel.categories[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                  itemCount:CategoryModel.categories.length
              ),
            ),



          ],
        ),
      ),
    );
  }
}
