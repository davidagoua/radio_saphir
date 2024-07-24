import 'package:get/get.dart';
import 'package:wordpress_api/wordpress_api.dart';

class ArticleDetailsController extends GetxController with StateMixin {
  
  WordPressAPI api = WordPressAPI("https://radiosaphir.net/");
  
  @override
  void onInit() {
    super.onInit();
    
    getMedia();
  }
  
  getMedia() async {
    final WPResponse res = await api.fetch('wp-json/wp/v2/media/${Get.parameters['media']!}');
  }



}
