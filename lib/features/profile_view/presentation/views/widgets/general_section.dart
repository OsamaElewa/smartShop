import 'package:flutter/material.dart';
import 'package:smart_shop/core/utils/app_strings.dart';
import 'package:smart_shop/core/utils/app_styles.dart';


import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_assets.dart';

import 'custom_list_tile.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.generalText,style: AppStyles.font17BlackBoldWeight,),
        verticalSpace(15),
        CustomListTile(text: AppStrings.allOrdersText, imagePath: AppAssets.orderSvg, function: (){}),
        verticalSpace(15),
        CustomListTile(text: AppStrings.wishlistText, imagePath: AppAssets.wishListSvg, function: (){}),
        verticalSpace(15),
        CustomListTile(text: AppStrings.viewedRecentlyText, imagePath: AppAssets.recent, function: (){}),
        verticalSpace(15),
        CustomListTile(text: AppStrings.addressText, imagePath: AppAssets.address, function: (){}),
      ],
    );
  }
}
