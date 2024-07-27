import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/controllers/request_controller.dart';
import 'package:tiktok_downloader/classes/request_status.dart';
import 'package:tiktok_downloader/controllers/finished_controller.dart';
import 'package:tiktok_downloader/widgets/my_button.dart';
import 'package:video_player/video_player.dart';

class FinishedTiktok extends StatelessWidget {
  const FinishedTiktok({super.key});

  @override
  Widget build(BuildContext context) {
    RequestController controller = Get.find();
    FinishedController finishedController = Get.find();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              finishedController.playOrPause();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                      width: 200,
                      height: 300,
                      child: VideoPlayer(finishedController.controller)),
                ),
                Obx(
                  () => Icon(
                    finishedController.icon,
                    color: Colors.grey.shade500,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Your Video Is Secessusfly Downloaded !",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          MyButton(
              onPressed: () {
                finishedController.controller.pause();
                controller.changeRequest(RequestStatus.preparing);
              },
              title: 'Download Another',
              icon: CupertinoIcons.repeat),
        ],
      ),
    );
  }
}
