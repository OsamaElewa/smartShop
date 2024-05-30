import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';


void showImageMethodsBottomSheet(
    {required BuildContext context, required Widget content}) {
  showModalBottomSheet(
    //backgroundColor: AppColors.transparent,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.radius25r),
        topRight: Radius.circular(AppConstants.radius25r),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) {
      return content;
    },
  );
}
