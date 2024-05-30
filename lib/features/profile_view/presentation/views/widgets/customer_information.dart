import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/utils/app_styles.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../logic/profile_cubit.dart';
import '../../logic/profile_state.dart';




class CustomerInformation extends StatelessWidget {
  const CustomerInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Row(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary,width: 3),
                  image: DecorationImage(
                      image: AssetImage(AppAssets.man),
                      fit: BoxFit.fill
                  )
              ),
            ),
            horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cubit.userModel!.userName!,style: AppStyles.font20BlackBoldWeight,),
                Text(cubit.userModel!.userEmail!,style: AppStyles.font15Black,),
              ],
            )
          ],
        );
      },
    );
  }
}
