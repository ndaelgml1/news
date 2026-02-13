import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/text_manager.dart';

class CategoryModel {
CategoryModel({required this.image , required this.text , required this.id });
  String image ;
  String text ;
  String id ;



  static List<CategoryModel> categories = [
    CategoryModel(image: AssetsManager.earth, text: TextManager.general , id: "general" ),
    CategoryModel(image: AssetsManager.business, text: TextManager.business , id: "business"),
    CategoryModel(image: AssetsManager.sport, text: TextManager.sport,  id: "sports") ,
    CategoryModel(image: AssetsManager.technology, text: TextManager.technology, id: "technology" ) ,
    CategoryModel(image: AssetsManager.health, text: TextManager.health, id: "health" ) ,
    CategoryModel(image: AssetsManager.science, text: TextManager.science, id: "science") ,

  ] ;

}