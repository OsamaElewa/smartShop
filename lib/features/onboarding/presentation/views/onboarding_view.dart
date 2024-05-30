import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_shop/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

import '../../../../core/utils/app_constants.dart';


class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppConstants.systemUiOverlayStyleDark,
        child: OnBoardingViewBody(),
      ),
    );
  }
}
