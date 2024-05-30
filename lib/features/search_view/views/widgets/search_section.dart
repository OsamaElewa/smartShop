import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';
import 'package:smart_shop/features/search_view/logic/search_state.dart';

import '../../../../core/utils/app_colors.dart';
import '../../logic/search_cubit.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit , HomeState>(
      builder: (context, state) {
        return TextField(
          controller: HomeCubit.get(context).searchController,
          decoration: InputDecoration(
            suffixIcon:HomeCubit.get(context).searchController.text.isEmpty ? null : IconButton(
                onPressed: () {
                  HomeCubit.get(context).clear();
                },
                icon: Icon(Icons.clear,color: Colors.red,)
            ),
            prefixIcon: Icon(Icons.search,color: Colors.blue,),
            hintText: 'Search',
            labelStyle: TextStyle(color: AppColors.darkScaffoldColor),

          ),
          onChanged: (value) => HomeCubit.get(context).searchChanged(),
        );
      },
    );
  }
}
