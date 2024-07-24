import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/article_details_controller.dart';

class ArticleDetailsView extends GetView<ArticleDetailsController> {
  const ArticleDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Vx.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Vx.blue800),
        titleTextStyle: const TextStyle(color: Vx.blue800, fontSize: 22),
        title: const Text("Article"),
        centerTitle: true,
      ),
      body: VStack([

        10.heightBox,
        "${Get.parameters["nom"]}".text.size(22).bold.make(),
        20.heightBox,
        "${Get.parameters['description']}".text.make()
      ]).scrollVertical().p(7),
    );
  }
}
