import 'package:flutter/material.dart';
import 'package:news/core/models/categoryModel.dart';
import 'package:news/core/remote/network/api_manager.dart';
import 'package:news/core/utils/text_manager.dart';
import 'package:news/core/widgets/drawer.dart';
import 'package:news/ui/home/details_home.dart';
import 'package:news/ui/home/general_home.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});


  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    ApiManager.getSource("sport");
    // TODO: implement initState
    super.initState();
  }
  CategoryModel ? categoryModel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: CustomDrawer(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(categoryModel!= null ? categoryModel!.text :
          TextManager.home ,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: (){},
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
