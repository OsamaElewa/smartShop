import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_strings.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../search_view/models/product_model.dart';
import '../../logic/home_cubit.dart';
import 'latest_arrival_item.dart';

class LatestArrivalList extends StatelessWidget {
  const LatestArrivalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return StreamBuilder<List<ProductModel>>(
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.latestArrivalsText, style: AppStyles.font20BlackBoldWeight),
                verticalSpace(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => LatestArrivalItem(model: HomeCubit.get(context).products1[index]),
                      separatorBuilder: (context, index) => horizontalSpace(10),
                      itemCount: HomeCubit.get(context).products1.length
                  ),
                ),
              ],
            );
          },

        );
      },
    );
  }
}
