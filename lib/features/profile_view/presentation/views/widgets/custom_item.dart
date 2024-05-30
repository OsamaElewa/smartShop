import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_styles.dart';




class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.text, required this.imagePath});

  final String text,imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Row(
            children: [
              Image(image: AssetImage(imagePath),height: 50.h,width: 50.w,),
              horizontalSpace(8),
              Text(text,style: AppStyles.font20BlackBoldWeight,)
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
