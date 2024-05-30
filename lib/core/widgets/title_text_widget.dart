import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_shop/core/utils/app_styles.dart';

class TitleTextWidget extends StatelessWidget {

  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  const TitleTextWidget({super.key,
    required this.label,
    this.maxLines, this.color, this.fontSize, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      style: AppStyles.font20BlackBoldWeight.copyWith(color: color,fontSize: fontSize,fontWeight: fontWeight),
    );
  }
}
