import 'package:flutter/material.dart';

import 'package:smart_shop/features/login_view/presentation/views/widgets/login_view_body.dart';

import '../../../../core/utils/app_colors.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: CacheHelper.getBoolean(key: 'isDark')! ? AppColors.darkBlue : AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
      ),
      body: const LoginViewBody(),
    );
  }
}
