import 'package:get/get.dart';
import 'package:radio_saphir/app/modules/Infos/controllers/infos_controller.dart';
import 'package:radio_saphir/app/modules/Live/controllers/live_controller.dart';
import 'package:radio_saphir/app/modules/News/controllers/news_controller.dart';
import 'package:radio_saphir/app/modules/Resume/controllers/resume_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ResumeController>(
      () => ResumeController(),
    );
    Get.lazyPut<LiveController>(
      () => LiveController(),
    );
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<InfosController>(
      () => InfosController(),
    );
  }
}
