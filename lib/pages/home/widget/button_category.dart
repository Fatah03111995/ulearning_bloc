import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_bloc/core/themes/textstyles.dart';

class ButtonCategory extends StatelessWidget {
  final bool isActive;
  final String label;
  const ButtonCategory({super.key, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: isActive ? Colors.blue[900] : Colors.grey.withOpacity(0.2),
      ),
      child: Text(
        label,
        style: TextStyles.s
            .copyWith(color: isActive ? Colors.white : Colors.black54),
      ),
    );
  }
}
