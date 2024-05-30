import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_assets.dart';
import 'package:smart_shop/core/utils/app_colors.dart';
import 'package:smart_shop/core/utils/app_font_weight.dart';
import 'package:smart_shop/core/utils/app_strings.dart';
import 'package:smart_shop/core/widgets/title_text_widget.dart';
import 'package:smart_shop/features/cart_view/presentation/logic/cart_state.dart';
import 'package:smart_shop/features/cart_view/presentation/views/widgets/cart_list.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';

import '../logic/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  BlocBuilder<HomeCubit , HomeState>(
      builder: (context, state) {
        if (HomeCubit.get(context).cartList.isNotEmpty) {
          return const CartList();
        }else{
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(AppAssets.shoppingBasket),
                height: size.height * 0.4,
                width: double.infinity,
              ),
              const TitleTextWidget(label: AppStrings.whoopsText,color: AppColors.redAccent,fontSize: 25,),
              verticalSpace(15),
              const TitleTextWidget(label: AppStrings.emptyCartText),
              verticalSpace(10),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TitleTextWidget(label: AppStrings.emptyCartText1,fontSize: 15,fontWeight: AppFontWeight.regular,),
                    TitleTextWidget(label: AppStrings.emptyCartText2,fontSize: 15,fontWeight: AppFontWeight.regular,),
                  ],
                ),
              ),
              verticalSpace(20.h),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    //maximumSize: MaterialStateProperty.all(const Size(120, 55)),
                    minimumSize: MaterialStateProperty.all(const Size(100, 55)),
                    elevation: MaterialStateProperty.all(0),
                    foregroundColor: MaterialStateProperty.all(AppColors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(AppColors.primary1),
                  ),
                  child: const Text('Shop now')
              )
            ],
          );
        }
      },
         );
  }
}
