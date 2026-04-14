import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/core/widgets/categoryItem.dart';

import '../../../core/Data/models/categoryModel.dart';

class GeneralHome extends StatefulWidget {
  void Function (CategoryModel category) onCategoryClicked;
   GeneralHome( this.onCategoryClicked);

  @override
  State<GeneralHome> createState() => _GeneralHomeState();
}

class _GeneralHomeState extends State<GeneralHome> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: REdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            TextManager.welcomeText.tr(),
            style: TextTheme.of(context).headlineMedium!.copyWith(fontSize: 24),

          ),
          SizedBox(height: 14.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context , index )=> CategoryItem(
                  index: index,
                  categoryModel:CategoryModel.categories[index],
                  onPressed: (){
                    widget.onCategoryClicked(CategoryModel.categories[index]);
                    setState(() {

                    });
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                itemCount:CategoryModel.categories.length
            ),
          ),
        ],
      ),
    );
  }
}
