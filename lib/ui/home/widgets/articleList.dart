import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/ui/home/widgets/articleItem.dart';

class Articlelist extends StatelessWidget {
  const Articlelist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=> ArticleItem(),
        separatorBuilder: (context,index)=> SizedBox(height: 16.h,),
        itemCount: 10
    );
  }
}
