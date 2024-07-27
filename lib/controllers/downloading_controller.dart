import 'package:get/get.dart';
import 'package:tiktok_downloader/models/tiktok_video.dart';

class DownloadingController extends GetxController {
  TiktokVideo? tiktokVideo;

  set settiktokVideo(Map<String, dynamic> json) {
    tiktokVideo = TiktokVideo.fromJson(json);
    update();
  }
}
