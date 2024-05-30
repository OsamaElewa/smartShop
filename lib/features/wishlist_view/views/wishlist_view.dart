import 'package:flutter/material.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/core/widgets/app_name_text_widget.dart';
import 'package:smart_shop/features/wishlist_view/views/widgets/wishlist_list.dart';

import '../../../core/utils/app_colors.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,color: CacheHelper.getData(key: 'isDark')!? AppColors.white : AppColors.black,)),
        title: const AppNameTextWidget(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: WishListList(),
      ),
    );
  }
}
