import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/helpers/spacing.dart';
import 'package:smart_shop/core/utils/app_colors.dart';

import '../../config/routes/app_routes.dart';

void showAlertDialog({
  required BuildContext context,
  required String message,
  bool isNotError = true,
  String? title,
  String? image,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      //title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image == null ? const SizedBox()
              : Image(image: AssetImage(image),height: 100.h,width: 100.w,),
          verticalSpace(8),
          Text(message),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isNotError,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel',style: TextStyle(color: AppColors.primary1),),
                ),
              ),
              TextButton(
                onPressed: () async{
                  await FirebaseAuth.instance.signOut();
                  if(context.mounted) {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.loginView, (route) => false);
                  }
                },
                child: const Text('Ok',style: TextStyle(color: AppColors.red),),
              ),

            ],
          )
        ],
      ),
    ),
  );
}