import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/features/cart_view/presentation/data/models/cart_model.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';

import '../../../../../core/utils/app_colors.dart';


class QuantityModalBottomSheet extends StatelessWidget {
  const QuantityModalBottomSheet({super.key, required this.model});

  final CartModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(5),
        Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
              color: AppColors.grey, borderRadius: BorderRadius.circular(10)),
        ),
        verticalSpace(5),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  HomeCubit.get(context).updateQuantity(
                      cartId: model.cartId,
                      productId: model.productId,
                      quantity: index + 1);
                  Navigator.pop(context);
                },
                child: Center(
                        child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.darkScaffoldColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary1),
                        ),
                      ),
                    )),
              ),
              itemCount: 30,
            separatorBuilder: (context,index) => verticalSpace(10),),
        ),
      ],
    );
  }
}
