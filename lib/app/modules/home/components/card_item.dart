import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_base_code/app/config/config.dart';
import 'package:get_base_code/app/data/models/state_model.dart';
import 'package:get_base_code/app/modules/home/components/home_detail.dart';

class CardItem extends StatelessWidget {
  final StateModel data;
  const CardItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(() => HomeDetail(data: data));
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: 80.sp,
            //   width: 80.sp,
            //   color: AppColor.grey1,
            // ),
            Image.asset(
              'assets/images/${data.slugState}.png',
              height: 80.sp,
              width: 80.sp,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  height: 80.sp,
                  width: 80.sp,
                  child: Center(
                    child: Icon(Icons.error),
                  ),
                );
              },
            ),
            12.0.width,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.0.height,
                  Text(
                    data.state ?? '',
                    style: AppFont.interBlack1.copyWith(
                      fontSize: 16.sp,
                      fontWeight: AppFont.semiBold,
                    ),
                  ),
                  8.0.height,
                  Text(
                    'Population : ${data.population}',
                    style: AppFont.interGrey1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
