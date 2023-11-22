import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:radio_saphir/app/modules/Infos/views/infos_view.dart';
import 'package:radio_saphir/app/modules/Live/views/live_view.dart';
import 'package:radio_saphir/app/modules/News/views/news_view.dart';
import 'package:radio_saphir/app/modules/Resume/views/resume_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.gray100,
      drawer: getDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.settings_input_component_sharp, color: Vx.blue800,))
        ],
        iconTheme: IconThemeData(color: Vx.blue800),
        backgroundColor: Vx.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Vx.blue800, fontSize: 22),
        title: const Text('Radio Saphir'),
        centerTitle: true,
      ),
      body: Obx(()=>IndexedStack(
        index: controller.indexStack(),
        children:  [
          ResumeView(),
          LiveView(),
          NewsView(),
          InfosView(),
        ],
      )),

      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
        activeIndex: controller.indexStack(),
        onTap: (int? i) => {
          controller.indexStack(i)
        },
        inactiveColor: Vx.gray300,
        activeColor: Vx.blue700,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        icons: const [
          LineIcons.home,
          LineIcons.podcast,
          LineIcons.newspaper,
          LineIcons.info
        ],
      )),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> {
          controller.pausePlay()
        },
        child: Container(
          child:  Obx(()=> controller.isPlaying()
              ? Lottie.network("https://assets6.lottiefiles.com/packages/lf20_tfifue0y.json")
              : Lottie.network("https://assets1.lottiefiles.com/packages/lf20_4gwqaodh.json")
          ),
        ).w(Get.width / 12 * 3),
      ),
    );
  }

  Drawer getDrawer(){
    return Drawer(
      child: VStack([
        Container(
          child: Image.asset("images/logo.png"),
        ).pOnly(top: 40).card.rounded.make(),
        ListTile(
          trailing: LineIcon.shareSquare(),
          title: "Partager".text.size(17).make(),
        ),
        ListTile(
          trailing: LineIcon.globe(),
          title: "Site Web".text.size(17).make(),
        ),
        ListTile(
          trailing: LineIcon.heart(),
          title: "Faire un don".text.size(17).make(),
        ),
      ]),
    );
  }
}
