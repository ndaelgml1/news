import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/models/categoryModel.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/text_manager.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    super.key,
    required this.index,
    required this.categoryModel,
    required this.onPressed,
  });
  int index;
  CategoryModel categoryModel;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
      child: Container(
        padding: REdgeInsetsDirectional.only(end: 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          children: [
            Image.asset(
              // matchTextDirection: true ,
              categoryModel.image,
              height: 198.h,
              width: 166.w,
              fit: BoxFit.fill,
            ),

            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    categoryModel.text,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: 30.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: REdgeInsetsDirectional.only(start: 14),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(84),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textDirection: index.isEven
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          TextManager.viewAll,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineMedium!.copyWith(fontSize: 28.sp),
                        ),

                        CircleAvatar(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          radius: 28.r,
                          child: SvgPicture.asset(
                            matchTextDirection: true,
                            AssetsManager.arrow,
                            height: 26.h,
                            width: 26.w,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.secondary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
