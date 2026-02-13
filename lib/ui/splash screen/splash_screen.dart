import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/routes_manager.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacementNamed(context, Routes.home) ;
    }) ;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
        body: Padding(
          padding: REdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Image.asset(
                AssetsManager.mic ,
                color: Theme.of(context).colorScheme.secondary ,
                colorBlendMode: BlendMode.srcIn ,
                height: 184.h,
                width: 107.w,
              ).animate().scale(duration: Duration(seconds: 3)),
              Spacer() ,
              Image.asset(
                AssetsManager.branding ,
                color: Theme.of(context).colorScheme.secondary ,
                colorBlendMode: BlendMode.srcIn ,
                height: 85.h,
                width: 214.w,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
