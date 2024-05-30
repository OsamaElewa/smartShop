import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';

import '../../../../core/utils/app_colors.dart';

class RemoveAllCart extends StatelessWidget {
  const RemoveAllCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit , HomeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            HomeCubit.get(context).removeAllCartBar();
          },
          icon: const Icon(Icons.delete, color: AppColors.redAccent),
        );
      },
    );
  }
}
