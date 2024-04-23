import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
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

        getEmissions(context),

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
          return Image.asset(emission["image"] ?? '').card.roundedSM.make();
        },
      ),
    ).h(Get.height / 10 * 2.5);
  }

  Widget getEmissions(BuildContext context){
    return VStack([
      HStack([
        "Nos emissions".text.bold.size(17).make().pOnly(left: 10),
        GestureDetector(
          child: "Voir tout".text.bold.color(Vx.blue500).make().pOnly(right: 10),
        )
      ], alignment: MainAxisAlignment.spaceBetween, crossAlignment: CrossAxisAlignment.center,).w(double.maxFinite),
      10.heightBox,
      
      /*
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
       */

      ...controller.emissions.map((e) => getEmissionOverview(context, e)),



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

  Widget getEmissionOverview(BuildContext context, Map<String, dynamic> e){
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      color: Vx.blue50,
      child: HStack([
        Image.asset("${e['image']}", height: 80,),
        5.widthBox,
        VStack([
          "${e['nom']}".text.bold.make(),
          10.heightBox,
          "description de l'emission ".text.color(Vx.gray500).make()
        ]).expand(),
        VStack([
          LineIcon.heart(size: 15, color: Vx.blue500,)
        ]),
      ], crossAlignment: CrossAxisAlignment.start,)
    ).onTap(() {
      Get.toNamed(Routes.NEWS_DETAILS, parameters: {
      "nom": e['nom'] ?? "",
      "image": e["image"] ?? "",
      "description": "description de l'emission si jamais y'en a"
      });
    }).marginOnly(top: 3, left: 10, right: 10).card.elevation(0).roundedSM.make();
  }
}
