
import 'package:flutter/material.dart';
import 'package:smart_shop/config/local/cache_helper.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme(context) {
  return ThemeData(
    scaffoldBackgroundColor: CacheHelper.getData(key: 'isDark')! ? AppColors.darkScaffoldColor : AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: CacheHelper.getData(key: 'isDark')! ? AppColors.darkScaffoldColor : AppColors.white,
      titleTextStyle: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CacheHelper.getData(key: 'isDark')! ? AppColors.darkScaffoldColor : AppColors.white,
      selectedItemColor: CacheHelper.getData(key: 'isDark')! ? AppColors.darkPrimary : AppColors.lightPrimary,
      unselectedItemColor: CacheHelper.getData(key: 'isDark')! ? AppColors.grey : AppColors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      bodyMedium: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      bodySmall: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      labelLarge: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      labelMedium: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      labelSmall: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      titleLarge: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      titleMedium: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      titleSmall: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),

    ),
    iconTheme: IconThemeData(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: CacheHelper.getData(key: 'isDark')! ? AppColors.darkScaffoldColor : AppColors.white,
      elevation: 100,
      modalElevation: 100,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.transparent,
      counterStyle: TextStyle(color: Colors.black),
      filled: true,
      contentPadding: EdgeInsets.all(10),
      hintStyle: TextStyle(color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: CacheHelper.getData(key: 'isDark')! ? AppColors.grey : Colors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: CacheHelper.getData(key: 'isDark')! ? AppColors.white : AppColors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(8),
      )
    ),
  );
}