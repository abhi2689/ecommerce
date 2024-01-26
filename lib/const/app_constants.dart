import 'package:ecommerce/model/categories_model.dart';
import 'package:ecommerce/services/assetManager.dart';

class AppConstants {
  static String newImageURL =
      'https://cdn.pixabay.com/photo/2014/04/03/00/36/money-308815_1280.png';

  static List<String> bannerImage = [
    'assets/images/banners/banner1.png',
    '${AssetManager.bannersImagepath}/banner2.png'
  ];



  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
        id: AssetManager.mobiles, name: 'Mobiles', image: AssetManager.mobiles),
    CategoriesModel(id: AssetManager.pc, name: 'pc', image: AssetManager.pc),
    CategoriesModel(
        id: AssetManager.electronics,
        name: 'Electronics',
        image: AssetManager.electronics),
    CategoriesModel(
        id: AssetManager.fashion, name: 'fashion', image: AssetManager.fashion),
    CategoriesModel(
        id: AssetManager.shoes, name: 'Shoes', image: AssetManager.shoes),
    CategoriesModel(
        id: AssetManager.watch, name: 'Watch', image: AssetManager.watch),CategoriesModel(
  id: AssetManager.book, name: 'Book', image: AssetManager.book),
  ];
}
