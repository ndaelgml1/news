import 'package:easy_localization/easy_localization.dart' show StringTranslateExtension;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/ui/search/widgets/search_state.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorRadius: Radius.circular(16.r),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (value){
        context.read<Search>().searchNow(value);
      },
      onChanged: (value){
        context.read<Search>().onSearchChanged(value);
      },
      decoration: InputDecoration(
        hintText: TextManager.search.tr(),
        hintStyle: Theme.of(context).textTheme.headlineMedium,
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.secondary,
          size: 24.sp,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.secondary,
            size: 24.sp,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5.w,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
