import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class InputTextApp extends StatelessWidget {
  final String? label;
  final String? hint;
  final IconData? icon;
  final bool isVisible;
  final void Function(String) onChanged;
  const InputTextApp(
      {super.key,
      this.label,
      required this.onChanged,
      this.hint,
      this.icon,
      this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(width: 1, color: Colors.black38)),
      child: Row(
        children: [
          if (icon != null) Icon(icon),
          if (icon != null) SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: TextStyles.s,
              obscureText: !isVisible,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  alignLabelWithHint: true,
                  hintText: hint,
                  hintStyle: TextStyles.s.copyWith(color: Colors.black45),
                  label: label != null ? Text(label!) : null,
                  labelStyle: TextStyles.smBold,
                  floatingLabelStyle: TextStyles.smBold),
            ),
          ),
        ],
      ),
    );
  }
}
