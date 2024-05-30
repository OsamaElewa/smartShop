import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';

class ViewedRecentlyItem extends StatelessWidget {
  const ViewedRecentlyItem({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FancyShimmerImage(
            height: 100.h,
            width: double.infinity,
            imageUrl: AppConstants.internetImagePath,
            boxFit: BoxFit.cover,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text('shoes'*5,
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
                  Text('\$165'),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
