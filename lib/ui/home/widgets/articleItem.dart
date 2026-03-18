import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/models/Article%20Model/Article.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/widgets/articleDetailsSheet.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  ArticleItem(this.article);
  Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          context: context,
          builder: (context) => Articledetailssheet(article),
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
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
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
              article.title ?? "",
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
                  "BY: ${article.author ?? ""}",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsManager.gray,
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt ?? "")),
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
  }
}
