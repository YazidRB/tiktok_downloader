import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/controllers/downloading_controller.dart';
import 'package:tiktok_downloader/controllers/request_controller.dart';
import 'package:tiktok_downloader/widgets/animated_text.dart';

class DownloadingTiktok extends StatelessWidget {
  const DownloadingTiktok({super.key});

  @override
  Widget build(BuildContext context) {
    RequestController controller = Get.find();
    DownloadingController downloadController = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/images/loading_boy.gif",
            width: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedText(text: 'Downloading Video...'),
          const SizedBox(height: 20),
          Obx(
            () => LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade400,
              backgroundColor: Colors.white,
              minHeight: 12,
              value: controller.prog.value / 100,
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => Text(
              '${controller.prog.value.toStringAsFixed(0)} %',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(
                  radius: 40,
                  child:
                      Image.network(downloadController.tiktokVideo!.avatarUrl),
                ),
              ),
              const Spacer(),
              Text(
                "@${downloadController.tiktokVideo!.userName}",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  downloadController.tiktokVideo!.coverUrl,
                  width: 150,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(downloadController.tiktokVideo!.likes.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 20,
                          child: Icon(
                            CupertinoIcons.eye,
                            color: Colors.grey.shade700,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(downloadController.tiktokVideo!.views.toString()),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
