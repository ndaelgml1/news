import 'package:news/core/utils/assets_manager.dart';
import 'package:news/core/utils/text_manager.dart';

class CategoryModel {
CategoryModel({required this.image , required this.text });
  String image ;
  String text ;



  static List<CategoryModel> categories = [
    CategoryModel(image: AssetsManager.earth, text: TextManager.general ,  ),
    CategoryModel(image: AssetsManager.business, text: TextManager.business),
    CategoryModel(image: AssetsManager.sport, text: TextManager.sport,) ,
    CategoryModel(image: AssetsManager.technology, text: TextManager.technology, ) ,
    CategoryModel(image: AssetsManager.health, text: TextManager.health, ) ,
    CategoryModel(image: AssetsManager.science, text: TextManager.science,) ,

  ] ;

}