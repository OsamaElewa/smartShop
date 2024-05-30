import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/core/utils/app_colors.dart';
import 'package:smart_shop/core/utils/app_styles.dart';
import 'package:smart_shop/features/register_view/logic/register_cubit.dart';
import 'package:smart_shop/features/register_view/logic/register_state.dart';

import '../helpers/spacing.dart';

void showCameraDialog({
  required BuildContext context,

}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      title: Center(child: Text('Choose option',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),)),

      content: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocBuilder<RegisterCubit , RegisterState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      elevation: 0
                  ),
                  onPressed: () {
                    RegisterCubit.get(context).getCameraImage();
                    //RegisterCubit.get(context).emit(RegisterImageState());
                    //Navigator.pop(context);
                  },
                  label: Text('Camera',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),),
                  icon: Icon(Icons.camera,color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      elevation: 0
                  ),
                  onPressed: () {
                    RegisterCubit.get(context).getGalleryImage();
                    //Navigator.pop(context);
                  },
                  label: Text('Gallery',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),),
                  icon: Icon(Icons.photo_album_outlined,color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.transparent,
                      elevation: 0
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text('Remove',style: TextStyle(color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black),),
                  icon: Icon(Icons.remove_circle_outline,color: AppColors.red,),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}