import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/features/category_view/category_view.dart';
import 'package:smart_shop/features/home_view/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryView(model: model,),));
      },
      child: Column(
        children: [
          Image(image: AssetImage(model.image),height: 50.h,width: 50.w,),
          Text(model.name),
        ],
      ),
    );
  }
}
