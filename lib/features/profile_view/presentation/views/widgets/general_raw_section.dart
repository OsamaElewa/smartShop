import 'package:flutter/material.dart';

import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_assets.dart';
import 'package:smart_shop/core/utils/app_strings.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_styles.dart';

import 'custom_item.dart';


class GeneralRawSection extends StatelessWidget {
  const GeneralRawSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.generalText,style: AppStyles.font20BlackBoldWeight,),
        verticalSpace(10),
        Column(
          children: [
            InkWell(
                onTap: () {},
                child: CustomItem(text: AppStrings.allOrdersText, imagePath: AppAssets.orderSvg)),
            verticalSpace(10),
            InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.wishlistView),
                child: CustomItem(text: AppStrings.wishlistText, imagePath: AppAssets.wishListSvg)),
            verticalSpace(10),
            InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.viewedRecentlyView),
                child: CustomItem(text: AppStrings.viewedRecentlyText, imagePath: AppAssets.recent)),
            verticalSpace(10),
            InkWell(
                onTap: () {},
                child: CustomItem(text: AppStrings.addressText, imagePath: AppAssets.address)),
          ],
        ),
      ],
    );
  }
}
