import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/functions/show_snack_bar.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';
import 'package:smart_shop/features/search_view/views/widgets/search_list.dart';
import 'package:smart_shop/features/search_view/views/widgets/search_section.dart';

import '../models/product_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {
        if (state is AddToCartSuccessStates) {
          showSuccessSnackBar(context: context, message: 'item has been added to cart');
        }
        if (state is AddToCartErrorStates) {
          showErrorSnackBar(context: context, message: state.error.toString());
        }
        if (state is ProductExistStates) {
          showSuccessSnackBar(context: context, message: 'this item is already in your cart');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 17.h),
            child: Column(
              children: [
                const SearchSection(),
                verticalSpace(15),
                const SearchList()
              ],
            ),
          ),
        );
      },

    );
  }
}
