import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/features/home_view/presentation/views/widgets/category_list.dart';
import 'package:smart_shop/features/home_view/presentation/views/widgets/latest_arrival_list.dart';
import 'package:smart_shop/features/home_view/presentation/views/widgets/swiper_section.dart';

import '../logic/home_cubit.dart';
import '../logic/home_state.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit , HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SwiperSection(),
                verticalSpace(15),
                const LatestArrivalList(),
                verticalSpace(15),
                const CategoryList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
