import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/config/routes/app_routes.dart';
import 'package:smart_shop/features/cart_view/presentation/logic/cart_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';

import 'config/theme_cubit/theme_cubit.dart';
import 'config/theme_cubit/theme_state.dart';
import 'config/themes/app_themes.dart';

class SmartShop extends StatelessWidget {
  const SmartShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => HomeCubit()..getProducts1()..getCart(),),
            BlocProvider(
              create: (context) => ThemeCubit(),
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: appTheme(context),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoutes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}