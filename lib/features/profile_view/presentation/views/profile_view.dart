import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/functions/show_alert_dialoge.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_assets.dart';
import 'package:smart_shop/core/utils/app_strings.dart';
import 'package:smart_shop/core/widgets/custom_divider.dart';
import 'package:smart_shop/features/profile_view/presentation/views/widgets/customer_information.dart';
import 'package:smart_shop/features/profile_view/presentation/views/widgets/general_raw_section.dart';
import 'package:smart_shop/features/profile_view/presentation/views/widgets/other_section.dart';
import 'package:smart_shop/features/profile_view/presentation/views/widgets/settings_section.dart';


import '../../../../core/utils/app_colors.dart';
import '../logic/profile_cubit.dart';
import '../logic/profile_state.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUser(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is ProfileSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomerInformation(),
                    verticalSpace(10),
                    const GeneralRawSection(),
                    // const GeneralSection(),
                    verticalSpace(15),
                    const CustomDivider(),
                    verticalSpace(15),
                    const SettingsSection(),
                    verticalSpace(15),
                    const CustomDivider(),
                    verticalSpace(15),
                    const OtherSection(),
                    verticalSpace(15),
                    ElevatedButton.icon(onPressed: () {
                      showAlertDialog(
                        context: context,
                        image: AppAssets.warningImage,
                        message: 'Are you sure you want to logout',
                      );
                    },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(AppColors.white),
                        backgroundColor: MaterialStateProperty.all(AppColors.redAccent),
                        iconColor: MaterialStateProperty.all(AppColors.white),
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text(AppStrings.logoutText),)
                  ],
                ),
              ),
            );
          }
          else {
            return Center(
              child: Text('error'),
            );
          }

        },
      ),
    );
  }
}