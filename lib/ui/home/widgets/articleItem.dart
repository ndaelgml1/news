import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/widgets/articleDetailsSheet.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          context: context,
          builder: (context) => Articledetailssheet(),
        );
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl:
                    "https://tse2.mm.bing.net/th/id/OIP.za5X761kw-Vh9Ow8BXNx_gHaEK?pid=Api&P=0&h=220",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 24.sp,
                    color: ColorsManager.red,
                  ),
                ),
                height: 220.h,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "40-year-old man falls 200 feet to his death while canyoneering at national park",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " john ",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.gray,
                  ),
                ),
                Text(
                  timeago.format(DateTime.now()),
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.gray,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
