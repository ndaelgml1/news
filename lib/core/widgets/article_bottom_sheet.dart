import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Data/models/Article Model/Article.dart';
import '../utils/colors_manager.dart';

class ArticleBottomSheet extends StatelessWidget {
  ArticleBottomSheet(this.article);
  Article article;
  @override
  Widget build(BuildContext context)  {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 20 , horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: REdgeInsets.all(8),
            margin: REdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16.r) ,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl:
                    article.urlToImage??"",
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
                SizedBox(height: 20.h),
                Padding(
                  padding: REdgeInsets.symmetric(vertical:8),
                  child: Text(
                    article.description??"" ,
                    style:GoogleFonts.inter(
                        fontSize: 14.sp ,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                SizedBox(
                    height: 18.h
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: REdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))
                    ),
                    onPressed: () {
                      launchUrl(
                        Uri.parse(article.url ?? "") ,
                        mode: LaunchMode.inAppBrowserView ,
                      ) ;
                    },
                    child: Text(
                      TextManager.viewFullArticle.tr(),
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18.h,) ,
              ],
            ),
          ),
        ],


      ),
    );
  }
}



