import 'package:flutter/material.dart';
import 'package:smart_shop/features/viewed_recently_view/views/widgets/viewed_recently_item.dart';
import 'package:smart_shop/features/wishlist_view/views/widgets/wishlist_item.dart';

class ViewedRecentlyList extends StatelessWidget {
  const ViewedRecentlyList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1 / 1.3,
        children: List.generate(10,
                (index) =>
            const ViewedRecentlyItem())
    );
  }
}
