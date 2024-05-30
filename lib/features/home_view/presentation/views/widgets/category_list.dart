import 'package:flutter/material.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_strings.dart';
import 'package:smart_shop/core/utils/app_styles.dart';
import 'package:smart_shop/features/home_view/data/models/category_model.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.categoriesText,style: AppStyles.font20BlackBoldWeight,),
        verticalSpace(15),
        GridView.count(
          childAspectRatio: 1 / 1.1,
          mainAxisSpacing: 40,
          crossAxisCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              categories.length,
                  (index) => CategoryItem(model: categories[index])),
        ),
      ],
    );
  }
}
