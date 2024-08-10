import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_base_code/app/config/config.dart';
import 'package:get_base_code/app/data/models/state_model.dart';
import 'package:get_base_code/app/modules/home/controllers/home_controller.dart';
import 'package:get_base_code/app/utils/util_launch_url.dart';
import 'package:get_base_code/app/widgets/custom_button.dart';

class HomeDetail extends StatelessWidget {
  final StateModel data;
  const HomeDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppDimen.wInfinit,
            height: 300.sp,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/${data.slugState}.png',
                  width: AppDimen.wInfinit,
                  height: 300.sp,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      width: AppDimen.wInfinit,
                      height: 300.sp,
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    padding: const EdgeInsets.only(top: 20),
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          24.0.height,
          Container(
            width: AppDimen.wInfinit,
            decoration: BoxDecoration(
              color: AppColor.white1,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColor.black1.withOpacity(0.04),
                  blurRadius: 32,
                  spreadRadius: 8,
                  offset: const Offset(1, 0), // Shadow position
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ID State',
                        style: AppFont.interBlack1,
                      ),
                    ),
                    Text(
                      data.iDState ?? '',
                      style: AppFont.interBlack1,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'State',
                        style: AppFont.interBlack1,
                      ),
                    ),
                    Text(
                      data.state ?? '',
                      style: AppFont.interBlack1,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ID Year',
                        style: AppFont.interBlack1,
                      ),
                    ),
                    Text(
                      data.iDYear.toString(),
                      style: AppFont.interBlack1,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Population',
                        style: AppFont.interBlack1,
                      ),
                    ),
                    Text(
                      data.population.toString(),
                      style: AppFont.interBlack1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          24.0.height,
          CustomButton(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            isLoading: false,
            func: () {
              HomeController c = Get.find();
              for (var element in c.jsonMaps) {
                if (data.slugState == element['slug']) {
                  UtilLaunchUrl()
                      .launchInApp(Uri.parse(element['map'].toString()));
                  return;
                }
              }
            },
            text: 'View Location',
            btnStyle: AppButtonStyle.btnDefault,
          ),
        ],
      ),
    );
  }
}
