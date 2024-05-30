import 'package:flutter/material.dart';
import 'package:smart_shop/features/onboarding/presentation/views/widgets/page_indicator_widget.dart';

import '../../../../../core/utils/app_constants.dart';
import 'custom_onboarding_app_bar.dart';
import 'next_button.dart';
import 'onboarding_page_view.dart';


class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: AppConstants.defaultPadding,
            right: AppConstants.defaultPadding,
            bottom: AppConstants.defaultPadding),
        child: const Column(
          children: [
            CustomOnBoardingAppBar(),
            OnBoardingPageView(),
            PageIndicatorWidget(),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
