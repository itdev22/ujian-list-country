import 'package:flutter/material.dart';
import 'package:get_base_code/app/config/config.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Function()? onTap;
  const CustomCard(
      {super.key,
      required this.child,
      this.margin,
      this.padding = const EdgeInsets.all(20),
      this.height,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: AppDimen.wInfinit,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: AppColor.white1,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
