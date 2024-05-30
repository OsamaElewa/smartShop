import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/core/utils/app_colors.dart';
import 'package:smart_shop/core/utils/app_constants.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/search_view/models/product_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_styles.dart';

class SearchItem extends StatelessWidget {
  SearchItem({super.key, required this.model});

  ProductModel? model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:CacheHelper.getData(key: 'isDark')!? AppColors.lightPrimary : AppColors.grey200,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FancyShimmerImage(
            height: 100.h,
            width: double.infinity,
            imageUrl: model!.productImage!,
            boxFit: BoxFit.cover,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(model!.productTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.font17BlackBoldWeight,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.favorite_border)
                ],
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${model!.productPrice!}'),
                  InkWell(
                    onTap: () {
                      HomeCubit.get(context).addToCart(
                        productId: model!.productId!,
                      );
                    },
                      child: Icon(Icons.shopping_cart))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
