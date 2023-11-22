import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:radio_saphir/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        Container(
          child: HStack([
            LineIcon.newspaper(size: 60, color: Vx.white,),
            "Actualités".text.size(20).color(Vx.white).make()
          ], alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center,).w(double.maxFinite),
        ).p(10).card.color(Vx.blue800).make().w(double.maxFinite),
        15.heightBox,
        controller.obx(
          (state) => VStack([
            ...controller.posts.map((element) => ListTile(
              onTap: ()=>{
                Get.toNamed(Routes.ARTICLE_DETAILS, parameters: {
                  "nom": element.title,
                  "image": "",
                  "description": element.content,
                })
              },
              title: "${element.title}".text.bold.make(),
              subtitle: "${element.date}".text.make(),
              trailing: IconButton(
                onPressed: ()=>{},
                icon: LineIcon.newspaperAlt(size: 30,),
              ),
            ))
          ]).scrollVertical().card.make().expand(),
          onLoading: CircularProgressIndicator().centered(),
          onEmpty: "Aucuns articles trouvés".text.size(20).make()
        )
      ]).p(7),
    );
  }

}
