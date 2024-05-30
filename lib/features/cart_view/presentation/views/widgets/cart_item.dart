import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/features/cart_view/presentation/views/widgets/quantity_modal_bottom_sheet.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../data/models/cart_model.dart';


class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.model});
  final CartModel model;
  @override
  Widget build(BuildContext context) {
    final currentItem = HomeCubit.get(context).getCartItemById(productId:model.productId);
    return BlocBuilder<HomeCubit , HomeState>(
      builder: (context, state) {
        return FittedBox(
          child: IntrinsicWidth(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FancyShimmerImage(
                    height: 100.h,
                    width: 100.w,
                    imageUrl: currentItem.productImage!,
                  ),
                ),
                horizontalSpace(10),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 194.w,
                            child: Text(currentItem.productTitle!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.font17BlackBoldWeight,
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(onPressed: () {
                                HomeCubit.get(context).removeCartItem(cartId: model.cartId, productId: model.productId, quantity: model.quantity);
                              }, icon: Icon(Icons.clear,color: Colors.red,)),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.favorite_border,color: Colors.red,))
                            ],
                          )
                        ],
                      ),
                      Row(

                        children: [
                          Text('\$ ${currentItem.productPrice}',style: AppStyles.font17BlueBoldWeight,),
                          const Spacer(),
                          //Text('\$ 50.00',style: AppStyles.font17BlackBoldWeight,),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await showModalBottomSheet(
                                context: context,
                                builder: (context) => QuantityModalBottomSheet(model: model,),
                              );
                            },
                            icon: Icon(Icons.arrow_drop_down,color: AppColors.primary1,),
                            label: Text('Qty ${model.quantity}'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
