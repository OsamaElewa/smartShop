import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/local/cache_helper.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../cubit/onboarding_cubit.dart';
import '../../cubit/onboarding_state.dart';


class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return GradientButton(
          onPressed: () {
            if (!OnBoardingCubit.get(context).isLast) {
              OnBoardingCubit.get(context).pageController.nextPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.linearToEaseOut,
                  );
            } else {
              CacheHelper.saveData(key: 'onBoarding', value: true)
                  .then((value) {
                Navigator.pushReplacementNamed(context, Routes.loginView);
              });
            }
          },
          title: Text(
            OnBoardingCubit.get(context).isLast
                ? AppStrings.getStarted
                : AppStrings.next,
            style: AppStyles.textStyle18.copyWith(
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
