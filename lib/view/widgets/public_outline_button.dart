import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import '../../resources/styles/app_colors.dart';

import 'public_text.dart';


class PublicOutlineButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final double? width;
  final double borderRadius;
  final double? titleSize;
  final Color titleColor;
  final Color backgroundColor;
  final double? verticalpadding;

  const PublicOutlineButton({
    super.key,
    required this.onPressed,
    this.titleSize,
    this.title = "",
    this.width,
    this.borderRadius = 12,
    this.titleColor = AppColors.orangePrimary,
    this.backgroundColor = AppColors.white,
    this.verticalpadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 306.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: titleColor,
          side: BorderSide(color: titleColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalpadding ?? 12.h),
          child: PublicText(
            txt: title,
            size: titleSize ?? 18.sp,
            color: titleColor,
            fw: FontWeight.w500, // medium
          ),
        ),
      ),
    );
  }
}