import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_assets.dart';

import '../../../../../core/utils/app_strings.dart';
import 'custom_item.dart';


class OtherSection extends StatelessWidget {
  const OtherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.otherText,style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),),
        verticalSpace(15),
        CustomItem(text: AppStrings.privacyText, imagePath: AppAssets.privacy)
      ],
    );
  }
}
