import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/category_view/widgets/category_item.dart';
import 'package:smart_shop/features/home_view/data/models/category_model.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_state.dart';
import 'package:smart_shop/features/search_view/models/product_model.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key , required this.model});
  CategoryModel? model;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit , HomeState>(
        builder: (context, state) {
          List<ProductModel> filterList=HomeCubit.get(context).products1.where((element) =>
          element.productCategory == model!.id).toList();
          if (filterList.isNotEmpty) {
            return GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.3,
                children: List.generate(filterList.length,
                        (index) =>
                        CategoryItem(model: filterList[index],))
            );
          }else{
            return const Center(
              child: Text('No Products'),
            );
          }
        },
      ),
    );
  }
}
