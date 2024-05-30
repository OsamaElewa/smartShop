import 'package:smart_shop/core/utils/app_assets.dart';

class CategoryModel {
  final int id;
  final String name;
  final String image;
  CategoryModel({required this.id ,required this.name,required this.image});



}

List<CategoryModel> categories = [
  CategoryModel(name: 'Phones', image: AppAssets.mobiles, id: 1),
  CategoryModel(name: 'Electronics', image: AppAssets.electronics, id: 2),
  CategoryModel(name: 'Watches', image: AppAssets.watch, id: 3),
  CategoryModel(name: 'Clothes', image: AppAssets.fashion, id: 4),
  CategoryModel(name: 'Laptops', image: AppAssets.pc, id: 5),
  CategoryModel(name: 'Cosmetics', image: AppAssets.cosmetics, id: 6),
  CategoryModel(name: 'Shoes', image: AppAssets.shoes, id: 7),
  CategoryModel(name: 'Books', image: AppAssets.bookImage, id: 8),

];