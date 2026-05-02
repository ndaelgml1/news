import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/routes_manager.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/core/widgets/drawer.dart';
import 'package:news/ui/search/search_page.dart';
import 'package:news/ui/home/details%20home/details_home.dart';
import 'package:news/ui/home/general%20home/general_home.dart';

import '../../core/Data/models/categoryModel.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  CategoryModel ? categoryModel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: CustomDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(categoryModel!= null ? categoryModel!.text :
          TextManager.home.tr() ,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, Routes.searchScreen) ;
              },
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: categoryModel != null ?
      DetailsHome(categoryModel!) :
      GeneralHome(showCategoryDetails) ,

    );
  }

   void showCategoryDetails (CategoryModel selectedCategory){
    categoryModel = selectedCategory ;
    setState(() {

    });
  }

}
