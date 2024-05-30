import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/config/theme_cubit/theme_state.dart';

import '../../../../../config/theme_cubit/theme_cubit.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';




class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Row(
          children: [
            Row(
              children: [
                Image(image: AssetImage(AppAssets.theme),height: 50.h,width: 50.w,),
                horizontalSpace(8),
                Text(AppStrings.darkModeText,style: AppStyles.font14BlackWhiteRegularWeight,)
              ],
            ),
            const Spacer(),
            Switch(
              value: ThemeCubit.get(context).isDark,
              onChanged: (value) => ThemeCubit.get(context).toggleTheme(value: value),)
          ],
        );
      },
    );
  }
}
