import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get normal => GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      );

  static TextStyle get xs => normal.copyWith(fontSize: 7.sp);
  static TextStyle get s => normal.copyWith(fontSize: 12.sp);
  static TextStyle get sm => normal.copyWith(fontSize: 14.sp);
  static TextStyle get m => normal.copyWith(fontSize: 20.sp);
  static TextStyle get ml => normal.copyWith(fontSize: 24.sp);
  static TextStyle get l => normal.copyWith(fontSize: 30.sp);
  static TextStyle get xl => normal.copyWith(fontSize: 40.sp);

  static TextStyle get xsBold => xs.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get sBold => s.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get smBold => sm.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get mBold => m.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get mlBold => ml.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get lBold => l.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get xlBold => xl.copyWith(fontWeight: FontWeight.bold);
}
