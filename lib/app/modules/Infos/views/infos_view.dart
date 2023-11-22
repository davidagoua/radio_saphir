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
          child: HStack([
            LineIcon.info(size: 60, color: Vx.white,),
            "A propos".text.size(20).color(Vx.white).make()
          ], alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center,).w(double.maxFinite),
        ).p(10).card.color(Vx.blue800).make().w(double.maxFinite),
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
