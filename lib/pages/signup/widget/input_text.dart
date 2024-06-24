import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final bool isVisible;
  final void Function(String) onChanged;
  const InputText(
      {super.key,
      required this.label,
      required this.onChanged,
      this.hint,
      this.icon,
      this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onChanged,
        style: TextStyles.s,
        obscureText: !isVisible,
        decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, size: 20.w) : null,
            contentPadding: icon != null ? EdgeInsets.only(left: 30.w) : null,
            hintText: hint,
            hintStyle: TextStyles.s.copyWith(color: Colors.black45),
            label: Text(label),
            labelStyle: TextStyles.smBold,
            floatingLabelStyle: TextStyles.smBold),
      ),
    );
  }
}
