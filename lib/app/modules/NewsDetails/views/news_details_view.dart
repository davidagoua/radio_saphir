import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Vx.blue800),
        titleTextStyle: const TextStyle(color: Vx.blue800, fontSize: 22),
        title: Text("${Get.parameters["nom"]}"),
        centerTitle: true,
      ),
      body: VStack([
        Container(
          child: Image.asset(Get.parameters["image"] ?? ""),
        ).card.make(),
        10.heightBox,
        "${Get.parameters["nom"]}".text.size(22).bold.make(),
        20.heightBox,
        "Description de l'emission".text.make()
      ]).p(7),
    );
  }
}
