import 'package:get/get.dart';
import 'package:radio_player/radio_player.dart';


class HomeController extends GetxController {

  final isPlaying = false.obs;
  final urlstream = "https://radio13.pro-fhi.net:19073/stream";
  RadioPlayer radioPlayer = RadioPlayer();
  final indexStack = 0.obs;


  @override
  void onInit() {
    super.onInit();
    radioPlayer.setChannel(title: "Radio Saphir", url: urlstream);
    updatePlay();
    radioPlayer.stateStream.listen((value) {
      isPlaying.value = value;
    });
  }



  updatePlay(){
  }

  pausePlay() {
    if(isPlaying()){
      radioPlayer.pause();
    }else{
      radioPlayer.play();
    }
    isPlaying.toggle();
  }

}
