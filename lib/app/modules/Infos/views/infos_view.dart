import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/infos_controller.dart';

class InfosView extends GetView<InfosController> {
  const InfosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Vx.blue500, Vx.blue900]
              )
          ),
          child: HStack([
            LineIcon.info(size: 60, color: Vx.white,),
            10.widthBox,
            [
              "A propos".text.size(20).bold.color(Vx.white).make(),
            ].vStack(crossAlignment: CrossAxisAlignment.center)
          ], alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center,).w(double.maxFinite),
        ).w(double.maxFinite).h(Get.height / 10 *2.5),
        15.heightBox,
        VStack([
          Container(
            child: Image.asset("images/logo.png"),
          ),
          Container(
            child: VxRichText("A propos de la Radio Saphir \n\n\n A record label"
                " or record company is a brand or trademark associated with the "
                "marketing of music recordings and music videos. Sometimes, "
                "a record label is also a publishing company that manages such "
                "brands and trademarks, coordinates the production, manufacture, "
                "distribution, marketing, promotion, and enforcement of copyright "
                "for sound recordings and music videos; also conducting talent "
                "scouting and development of new artists.").make(),
          )
        ]).p(10).scrollVertical().card.make().expand()
      ]).p(7),
    );
  }
}
