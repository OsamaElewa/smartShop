import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_styles.dart';
import 'package:smart_shop/features/profile_view/presentation/views/widgets/theme_section.dart';

import '../../../../../core/utils/app_strings.dart';


class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.settingsText,style: AppStyles.font17BlackBoldWeight,),
        verticalSpace(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: const ThemeSection(),
        ),
      ],
    );
  }
}
