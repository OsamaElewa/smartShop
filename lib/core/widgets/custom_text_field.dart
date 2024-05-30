import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.title,
    this.suffixIcon,
    required this.hintText,
    this.maxLength,
    this.textInputType,
    this.obscureText = false,
    this.prefixIcon,
    this.paddingForTop,
    this.paddingForBottom,
    this.maxLines,
    this.readOnly = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final bool obscureText;
  final double? paddingForTop;
  final double? paddingForBottom;
  final int? maxLines;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.font16WhiteRegular.copyWith(color: AppColors.grey),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: paddingForTop ?? AppConstants.defaultPadding,
            bottom: paddingForBottom ?? AppConstants.padding15h,
          ),
          child: TextFormField(
            style: TextStyle(color: AppColors.grey),
            readOnly: readOnly,
            onTapOutside: (value) {
              FocusScope.of(context).unfocus();
            },
            maxLines: maxLines ?? 1,
            controller: controller,
            keyboardType: textInputType,
            maxLength: maxLength,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              filled: true,
              isDense: true,
              hintStyle: AppStyles.font14GreyRegular.copyWith(color: AppColors.grey),
              fillColor: AppColors.grey50,
              border: AppConstants.enabledBorder,
              focusedBorder: AppConstants.focusedBorder,
            ),
          ),
        ),
      ],
    );
  }
}
