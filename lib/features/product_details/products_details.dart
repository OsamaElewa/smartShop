import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_colors.dart';
import 'package:smart_shop/core/utils/app_constants.dart';
import 'package:smart_shop/core/utils/app_styles.dart';

import '../../core/widgets/app_name_text_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black,
            )
        ),
        title: const AppNameTextWidget(),
      ),
      body: Column(
        children: [
          FancyShimmerImage(
              imageUrl: AppConstants.internetImagePath,
            height: 200.h,
            width: double.infinity,
            boxFit: BoxFit.cover,
          ),
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250.w,
                    child: Text('text' * 15,style: AppStyles.font20BlackBoldWeight,maxLines: 3,)),
                Text('\$150',style: AppStyles.font17BlackBoldWeight.copyWith(color: AppColors.primary1,))
              ],
            ),
          ),
          verticalSpace(10),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.teal,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite_border,color: AppColors.white,),
                ),
                horizontalSpace(10),
                Expanded(
                  child: ElevatedButton.icon(onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary1,
                      foregroundColor: AppColors.white
                    ),
                    icon: Icon(Icons.add_shopping_cart),
                  label: Text('Add to cart'),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('About this item',style: AppStyles.font20BlackBoldWeight,),
                Text('in Phones',style: AppStyles.font20BlackBoldWeight,),
              ],
            ),
          ),
          verticalSpace(8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description' * 20,style: AppStyles.font16WhiteRegular,),
          )
        ],
      ),
    );
  }
}
