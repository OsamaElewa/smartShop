import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/local/cache_helper.dart';
import 'app_colors.dart';
import 'app_font_weight.dart';

 abstract class AppStyles {
  static TextStyle font20BlackBoldWeight = TextStyle(
    fontSize: 20.sp,
    fontWeight: AppFontWeight.bold
  );

  static final textStyle14 = TextStyle(
   fontSize: 12.sp,
   color: AppColors.grey,
  );

  static final textStyle18 = TextStyle(
   fontSize: 16.sp,
  );

  static final textStyle22 = TextStyle(
   fontSize: 20.sp,
   fontWeight: FontWeight.bold,
  );

  static final textStyle15 = TextStyle(
   fontSize: 13.sp,
   color: AppColors.grey,
  );

  static TextStyle font15Black = TextStyle(
      fontSize: 15.sp,
  );

  static TextStyle font17BlackBoldWeight = TextStyle(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.bold
  );

  static TextStyle font16BlackBoldWeight = TextStyle(
      fontSize: 16.sp,
      fontWeight: AppFontWeight.bold
  );

  static TextStyle font14BlackBoldWeight = TextStyle(
      fontSize: 12.sp,
  );

  static TextStyle font17BlueBoldWeight = TextStyle(
      fontSize: 17.sp,
      color: Colors.blue,
      fontWeight: AppFontWeight.bold
  );
  static  TextStyle font14BlackWhiteRegularWeight = TextStyle(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.regular
  );

  static  TextStyle font14GreyNormal = TextStyle(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.regular
  );
//color: CacheHelper.getBoolean(key: 'isDark')! ? AppColors.white : AppColors.black
  static TextStyle font14GreyRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: AppFontWeight.regular
  );

  static TextStyle font13DarkBlueMedium = TextStyle(
      fontSize: 13.sp,
      fontWeight: AppFontWeight.medium
  );

  static TextStyle font13DarkBlueRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: AppFontWeight.regular
  );

  static TextStyle font13BlueSemiBold = TextStyle(
      fontSize: 13.sp,
      fontWeight: AppFontWeight.semiBold
  );


  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: AppFontWeight.bold
  );

  static TextStyle font13GreyRegular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.normal,
  );

  static TextStyle font16WhiteRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );
}
