import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import '../../resources/styles/app_colors.dart';


class PublicTextFormField extends StatefulWidget {
  final String hint;
  final String? label;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputType keyboardtype;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool isPassword;
  final bool showprefixIcon;
  final bool showSuffixIcon;
  final int? maxlenght;
  final int? maxLines;
  final Function()? ontap;
  final Function()? ontapPrefixIcon;
  final Function()? ontapSuffixIcon;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const PublicTextFormField({
    super.key,
    required this.hint,
    required this.validator,
    this.label,
    this.controller,
    this.isPassword = false,
    this.showSuffixIcon = false,
    this.showprefixIcon = false,
    this.ontap,
    this.keyboardtype = TextInputType.text,
    this.maxlenght,
    this.maxLines,
    this.prefixIcon = Icons.person,
    this.suffixIcon = Icons.person,
    this.ontapPrefixIcon,
    this.ontapSuffixIcon,
    this.borderRadius = 12,
    this.contentPadding,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<PublicTextFormField> createState() => _PublicTextFormFieldState();
}

class _PublicTextFormFieldState extends State<PublicTextFormField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 374.w,
      //height: 57.h,
      child: TextFormField(
        textCapitalization: TextCapitalization.none,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxlenght,
        obscureText: widget.isPassword ? showPassword : false,
        keyboardType: widget.keyboardtype,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.disabled,
        validator: widget.validator,
        decoration: InputDecoration(
          fillColor: AppColors.backgroundGrey,
          iconColor: AppColors.orangePrimary,
          filled: true,
          labelText: widget.label,
          labelStyle: TextStyle(color: AppColors.orangePrimary, fontSize: 18.sp),
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide:
                const BorderSide(color: Colors.white, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: AppColors.orangePrimary, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.red, width: 0.5),
          ),
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          prefixIcon: widget.showprefixIcon
              ? InkWell(
                onTap: widget.ontapPrefixIcon,
                child: Icon(
                    widget.prefixIcon,
                    size: 22,
                    color: AppColors.orangePrimary,
                  ),
              )
              : null,
          suffixIcon: getSuffixIcon(),
        ),
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
      ),
    );
  }

  Widget? getSuffixIcon() {
    if (widget.showSuffixIcon) {
      if (!widget.isPassword) {
        return Icon(
          widget.suffixIcon,
          size: 22,
          color: AppColors.orangePrimary,
        );
      }
      return InkWell(
        onTap: (() {
          setState(() {
            showPassword = !showPassword;
          });
        }),
        child: !showPassword
            ? const Icon(
                Icons.visibility,
                color: AppColors.orangePrimary,
              )
            : const Icon(
                Icons.visibility_off,
                color: AppColors.orangePrimary,
              ),
      );
    }
    return null;
  }
}
