import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/core/widgets/custom_divider.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';


import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'cart_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cartList = HomeCubit.get(context).cartList;
          if (cartList.isEmpty) {
            return const Center(
              child: Text('No Products'),
            );

          }  else{
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => CartItem(model: HomeCubit.get(context).cartList.values.toList()[index],),
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CustomDivider(),
                      ),
                      itemCount: HomeCubit.get(context).cartList.length
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.symmetric(
                      vertical: BorderSide(
                        color: AppColors.primary1,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total ${HomeCubit.get(context).cartList.length} products / ${HomeCubit.get(context).getQuantity()} items',style: AppStyles.font14BlackBoldWeight,),
                              Text('${HomeCubit.get(context).getTotal()} L.E',style: AppStyles.font17BlackBoldWeight,)
                            ],
                          ),

                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.primary1),
                            foregroundColor: MaterialStateProperty.all(AppColors.white),
                          ),
                          onPressed: () {},
                          child: Text('Checkout')
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
    );

  }
}
