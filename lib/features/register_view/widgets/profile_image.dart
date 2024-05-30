import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/functions/show_camera_dialog.dart';
import 'package:smart_shop/core/functions/show_image_methods_bottom_sheet.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/features/register_view/logic/register_cubit.dart';
import 'package:smart_shop/features/register_view/logic/register_state.dart';

import '../../../config/local/cache_helper.dart';
import '../../../core/utils/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit , RegisterState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: RegisterCubit.get(context).imageData == null ?
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.grey,
                        width: 2,
                      )
                  ),
                ) :
                Image(image: FileImage(RegisterCubit.get(context).imageData!),height: 100.h,width: 100.w,),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  //RegisterCubit.get(context).getCameraImage();
                 // showCameraDialog(context: context);
                  showImageMethodsBottomSheet(context: context, content: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpace(5),
                        Container(
                          height: 5,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.grey, borderRadius: BorderRadius.circular(10)),
                        ),
                        verticalSpace(5),
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
                    ),
                  ));
                },
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary1,
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.camera_alt_outlined,color: AppColors.white,),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
