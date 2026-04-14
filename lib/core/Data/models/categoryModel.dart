import 'package:easy_localization/easy_localization.dart';
import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/text_manager.dart';

class CategoryModel {
CategoryModel({required this.image , required this.text , required this.id });
  String image ;
  String text ;
  String id ;



  static List<CategoryModel> categories = [
    CategoryModel(image: AssetsManager.earth, text: TextManager.general.tr() , id: "general" ),
    CategoryModel(image: AssetsManager.business, text: TextManager.business.tr() , id: "business"),
    CategoryModel(image: AssetsManager.sport, text: TextManager.sport.tr(),  id: "sports") ,
    CategoryModel(image: AssetsManager.technology, text: TextManager.technology.tr(), id: "technology" ) ,
    CategoryModel(image: AssetsManager.health, text: TextManager.health.tr(), id: "health" ) ,
    CategoryModel(image: AssetsManager.science, text: TextManager.science.tr(), id: "science") ,

  ] ;

}