import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/config/routes/app_routes.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_constants.dart';
import 'package:smart_shop/core/utils/app_styles.dart';
import 'package:smart_shop/features/search_view/models/product_model.dart';

import '../../../../../core/utils/app_colors.dart';


class LatestArrivalItem extends StatelessWidget {
  const LatestArrivalItem({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.productDetailsView),
      child: Container(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h,right: 5.w),
        //width: 180.w,
        decoration: BoxDecoration(
          color: CacheHelper.getData(key: 'isDark')!? AppColors.lightPrimary : AppColors.grey200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FancyShimmerImage(
                      imageUrl: model.productImage!,
                    height: 100.h,
                    width: 100.w,
                  )
              ),
              horizontalSpace(5),
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70.w,
                        child: Text(
                          model.productTitle!,
                          style: AppStyles.font17BlackBoldWeight,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ),
                    verticalSpace(5),
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        const Spacer(),
                        Icon(Icons.shopping_cart),
                      ],
                    ),
                    verticalSpace(10),
                    Text('\$${model.productPrice}'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
