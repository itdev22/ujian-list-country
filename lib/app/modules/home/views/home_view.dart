import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_base_code/app/config/config.dart';
import 'package:get_base_code/app/modules/home/components/card_item.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'List Country',
            style: AppFont.interBlack1.copyWith(
              fontSize: 20.sp,
              fontWeight: AppFont.semiBold,
            ),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(color: AppColor.mainColor),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.getState();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        ...controller.stateList.map((e) => CardItem(data: e))
                      ],
                    ),
                  ),
                ),
        ));
  }
}
