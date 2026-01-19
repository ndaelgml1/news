import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/routes_manager.dart';
import 'package:news/core/utils/text_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 180.h,
              width: double.infinity,
              color: ColorsManager.white,
              child: Center(
                child: Text(
                    TextManager.newsApp,
                  style: Theme.of(context).textTheme.displayMedium
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.home,
                        colorFilter: ColorFilter.mode(ColorsManager.white, BlendMode.srcIn),
                        height: 28.h,
                        width: 28.w,
                      ) ,
                      SizedBox(width: 4.w,),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, Routes.home) ;
                          },
                          child: Text(
                            TextManager.goToHome,
                            style : Theme.of(context).textTheme.displaySmall,
      
                          )
                      ) ,
      
                    ],
                  ),
                  SizedBox(height: 24.h,),
                  Divider() ,
                  SizedBox(height: 24.h,),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.theme,
                        colorFilter: ColorFilter.mode(ColorsManager.white, BlendMode.srcIn),
                        height: 28.h,
                        width: 28.w,
                      ) ,
                      SizedBox(width: 8.w,),
                      Text(
                          TextManager.theme,
                        style : Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ) ,
                  SizedBox(height: 8.h,),
      
      
                  SizedBox(height: 24.h,),
                  Divider(),
                  SizedBox(height: 24.h,),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.language,
                        colorFilter: ColorFilter.mode(ColorsManager.white, BlendMode.srcIn),
                        height: 28.h,
                        width: 28.w,
                      ) ,
                      SizedBox(width: 8.w,),
                      Text(
                        TextManager.language,
                        style : Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ) ,
                  SizedBox(height: 8.h,),
      
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
