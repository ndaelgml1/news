import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/text_manager.dart';

import '../utils/colors_manager.dart';

class Articledetailssheet extends StatelessWidget {
  const Articledetailssheet({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
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
            "A 40-year-old man has fallen approximately 200 feet to his death while canyoneering with three others at Zion National Park in Utah, authorities confirmed.\r\nThe incident occurred on Saturday when the… [+1529 chars]",
            style:GoogleFonts.inter(
                fontSize: 14.sp ,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: REdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.primary,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))
              ),
              onPressed: () {},
              child: Text(
                TextManager.viewFullArticle,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
