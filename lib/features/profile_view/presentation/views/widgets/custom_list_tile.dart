import 'package:flutter/material.dart';

import 'package:smart_shop/core/utils/app_styles.dart';


class CustomListTile extends StatelessWidget {
  CustomListTile({super.key,
    required this.text,
    required this.imagePath,
    required this.function
  });
  String text, imagePath;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image(image: AssetImage(imagePath)),
      title: Text(text,style: AppStyles.font20BlackBoldWeight,),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
