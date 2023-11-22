import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_saphir/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/resume_controller.dart';

class ResumeView extends GetView<ResumeController> {
  const ResumeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        getSwiper(),

        10.heightBox,

        getEmissions(),

      ]),
    );
  }

  Widget getSwiper(){
    return Container(
      child:  VxSwiper.builder(
        itemCount: 10,
        height: 400,
        itemBuilder: (context, index) {
          var emission = controller.emissions[index];
          return Image.asset(emission["image"] ?? '').card.rounded.make();
        },
      ),
    ).h(Get.height / 10 * 2.5);
  }

  Widget getEmissions(){
    return VStack([
      HStack([
        "Nos emissions".text.bold.size(17).make().pOnly(left: 10),
        GestureDetector(
          child: "Voir tout".text.color(Vx.blue400).make().pOnly(right: 10),
        )
      ], alignment: MainAxisAlignment.spaceBetween, crossAlignment: CrossAxisAlignment.center,).w(double.maxFinite),
      10.heightBox,

      ...controller.emissions.map((e) => ListTile(
        onTap: ()=>{
          Get.toNamed(Routes.NEWS_DETAILS, parameters: {
            "nom": e['nom'] ?? "",
            "image": e["image"] ?? "",
            "description": "description de l'emission"
          })
        },
        title: "${e['nom']}".text.make(),
        subtitle: "description de l'emission".text.make(),
        leading: VxCard(Image.asset("${e['image']}"),).make(),
      )),



    ]).scrollVertical().expand();
  }

  Widget getPlayPause(){

    HomeController homeController = Get.find();

    return Container(
      color: Vx.white,
      child: VStack([
        Container(color: Vx.gray100,).h(5).w(50).cornerRadius(15).centered(),
        HStack([
          Image.asset("images/logo.png", width: Get.width / 12 * 7,).expand(flex: 1),
          GestureDetector(
            onTap: ()=> {
              homeController.pausePlay()
            },
            child: Container(
              child:  Obx(()=> homeController.isPlaying()
                  ? Lottie.network("https://assets6.lottiefiles.com/packages/lf20_tfifue0y.json")
                  : Lottie.network("https://assets1.lottiefiles.com/packages/lf20_4gwqaodh.json")
              ),
            ).w(Get.width / 12 * 3),
          )
        ], alignment: MainAxisAlignment.spaceBetween, crossAlignment: CrossAxisAlignment.center,)
            .expand().w(double.maxFinite)
      ]).p(10),
    ).expand();
  }


}
