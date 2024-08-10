import 'package:flutter/material.dart';
import 'package:get_base_code/app/config/config.dart';

class CustomNumber extends StatelessWidget {
  final int number;
  const CustomNumber({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColor.green1.withOpacity(0.1),
        border: Border.all(color: AppColor.green1),
      ),
      child: Text(
        number.toString(),
        style: AppFont.interBlue1.copyWith(
          fontWeight: AppFont.bold,
          fontSize: 11.sp,
          color: AppColor.green1,
        ),
      ),
    );
  }
}
