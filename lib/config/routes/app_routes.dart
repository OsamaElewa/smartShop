

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/core/animations/page_slide_transition.dart';
import 'package:smart_shop/features/layout_view/views/layout_view.dart';
import 'package:smart_shop/features/product_details/products_details.dart';
import 'package:smart_shop/features/register_view/logic/register_cubit.dart';
import 'package:smart_shop/features/register_view/register_view.dart';
import 'package:smart_shop/features/viewed_recently_view/views/viewed_recently_view.dart';
import 'package:smart_shop/features/wishlist_view/views/wishlist_view.dart';

import '../../core/animations/page_fade_transition.dart';
import '../../core/utils/app_strings.dart';
import '../../features/login_view/presentation/logic/login_cubit.dart';
import '../../features/login_view/presentation/views/login_view.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cubit.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';



class Routes {

  static const String onBoardingView = '/';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String layoutView = '/layout_view';
  static const String productDetailsView = '/product_details_view';
  static const String wishlistView = '/wishlist_view';
  static const String viewedRecentlyView = '/viewed_recently_view';


}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.onBoardingView:
        return PageFadeTransition(
          page: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingView(),
          ),
        );
      case Routes.loginView:
        return PageFadeTransition(
          page: BlocProvider(
              create: (BuildContext context) => LoginCubit(),
              child: const LoginView()),
        );
      case Routes.registerView:
        return PageFadeTransition(
          page: BlocProvider(
              create: (BuildContext context) => RegisterCubit(),
              child: const RegisterView()),
        );
      case Routes.layoutView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: const LayoutView(),
        );

      case Routes.productDetailsView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: const ProductDetails(),
        );
      case Routes.wishlistView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: const WishListView(),
        );

      case Routes.viewedRecentlyView:
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: const ViewedRecentlyView(),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
