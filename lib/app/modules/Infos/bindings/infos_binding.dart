import 'package:get/get.dart';

import '../controllers/infos_controller.dart';

class InfosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfosController>(
      () => InfosController(),
    );
  }
}
