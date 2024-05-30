// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:smart_shop/features/cart_view/presentation/logic/cart_cubit.dart';
//
// import '../../../../core/functions/show_snack_bar.dart';
// import '../../../cart_view/presentation/logic/cart_state.dart';
// import '../../models/product_model.dart';
//
// class AddToCartButton extends StatelessWidget {
//   const AddToCartButton({super.key, required this.model});
//
//   final ProductModel? model;
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CartCubit, CartState>(
//       listener: (context, state) {
//         if (state is AddToCartSuccessStates) {
//           showSuccessSnackBar(context: context, message: 'item has been added to cart');
//         }
//         if (state is AddToCartErrorStates) {
//           showErrorSnackBar(context: context, message: state.error.toString());
//         }
//         if (state is ProductExistStates) {
//           showSuccessSnackBar(context: context, message: 'this item is already in your cart');
//         }
//       },
//       builder: (context, state) {
//         return InkWell(
//             onTap: () {
//               CartCubit.get(context).addToCart(
//                 productId: model!.productId!,
//               );
//             },
//             child: const Icon(Icons.shopping_cart));
//       },
//     );
//   }
// }
