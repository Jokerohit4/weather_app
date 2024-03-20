import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/app_colors.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.title, required this.onTap});
  final String title;
  final void Function () onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.8.sw,
        padding: EdgeInsets.symmetric(horizontal: 0.1.sw,vertical: 0.03.sw),
        margin: EdgeInsets.symmetric(vertical: 0.02.sh),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(title,style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.whiteColor,fontWeight: FontWeight.bold,letterSpacing: 1),),
        ),
      ),
    );
  }
}
