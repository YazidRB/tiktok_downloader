import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class FinishedController extends GetxController {
  late VideoPlayerController controller;
  var isPlaying = false.obs;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  initVideoPlayer(String videoPath) {
    controller = VideoPlayerController.file(File(videoPath))
      ..initialize().then((_) {
        update();
      });
  }

  playOrPause() {
    if (controller.value.isPlaying) {
      controller.pause();
      isPlaying.value = false;
    } else {
      controller.play();
      isPlaying.value = true;
    }
  }

  IconData get icon =>
      isPlaying.value ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill;
}
