import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/live_controller.dart';

class LiveView extends GetView<LiveController> {
  const LiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topLeft, 
                end: Alignment.bottomRight, 
                colors: <Color>[Vx.blue500, Vx.blue900]
            )
          ),
          child: HStack([
            LineIcon.podcast(size: 60, color: Vx.white,),
            10.widthBox,
            [
              "Podcast".text.size(20).bold.color(Vx.white).make(),
              "Lorem ipsum dolor sit amus, \nvehi qualiaqarae nun vertus es \nlibitum volae madgor".text.color(Vx.white).make()
            ].vStack(crossAlignment: CrossAxisAlignment.start)
          ], alignment: MainAxisAlignment.center, crossAlignment: CrossAxisAlignment.center,).w(double.maxFinite),
        ).w(double.maxFinite).h(Get.height / 10 *2.5),
        15.heightBox,
        "Podcast recents".text.bold.make(),
        15.heightBox,
        VStack([
          ListTile(
            title: "Table ronde".text.size(17).make(),
            subtitle: "Miles Monroe | 23:01".text.color(Vx.gray500).size(10).make(),
            leading: Image.asset("images/table_ronde.jpg").h(Get.height / 100 * 20),
            trailing: IconButton(
              icon: LineIcon.playCircle(size: 30,),
              onPressed: ()=>{},
            ),
          ).card.make(),
        ]).scrollVertical()
      ]).p(7),
    );
  }
}
