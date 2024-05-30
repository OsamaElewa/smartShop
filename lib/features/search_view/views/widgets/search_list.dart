import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';
import 'package:smart_shop/features/search_view/logic/search_cubit.dart';
import 'package:smart_shop/features/search_view/views/widgets/search_item.dart';

import '../../models/product_model.dart';

class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context, state) {
        return StreamBuilder <List<ProductModel>>(
          stream: HomeCubit.get(context).getProducts1(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            else if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Products'),
              );
            }
            return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.3,
                children: List.generate(HomeCubit.get(context).products1.length,
                        (index) =>
                        SearchItem(model: HomeCubit.get(context).products1[index],))
            );
          },
        );
      },
    );
  }
}
