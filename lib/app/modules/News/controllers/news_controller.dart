
import 'package:get/get.dart';
import 'package:wordpress_api/wordpress_api.dart';

class NewsController extends GetxController with StateMixin {
  
  WordPressAPI api = WordPressAPI("https://radiosaphir.net/");
  RxList posts = [].obs;
  
  @override
  void onInit() {
    super.onInit();
    Get.printInfo(info: "debug");
    getPost();
  }

  getPost() async {

    final WPResponse res = await api.posts.fetch();
    for (final post in res.data) {
      posts.value.add(post);
    }
    change(res.data, status: RxStatus.success());
  }


}
