import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_shop/core/utils/app_assets.dart';
import 'package:smart_shop/core/utils/app_strings.dart';
import 'package:smart_shop/core/widgets/app_name_text_widget.dart';
import 'package:smart_shop/features/layout_view/views/widgets/remove_all_cart.dart';

import '../../../core/utils/app_colors.dart';
import '../logic/layout_cubit.dart';
import '../logic/layout_state.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                leading: Image(image: AssetImage(AppAssets.shoppingCart)),
                title: const AppNameTextWidget(),
                actions: [
                  Visibility(
                    visible: LayoutCubit.get(context).currentIndex == 2 ? true : false,
                    child: RemoveAllCart(),
                  ),
                ],
              ),
              body: LayoutCubit.get(context).screens[LayoutCubit.get(context).currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: LayoutCubit.get(context).currentIndex,
                onTap: (index){
                  LayoutCubit.get(context).changeIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.homeText),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label: AppStrings.searchText),
                  BottomNavigationBarItem(icon: Badge(backgroundColor: AppColors.redAccent,label: Text('6'), child: Icon(Icons.shopping_cart)), label: AppStrings.cartText),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: AppStrings.profileText),
                ],
              ),
             // bottomSheet:LayoutCubit.get(context).currentIndex == 2 ?  const CartBottomCheckout() : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
