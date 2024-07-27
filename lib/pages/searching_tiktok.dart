import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/controllers/downloading_controller.dart';
import 'package:tiktok_downloader/controllers/searching_controller.dart';

class SearchingTiktok extends StatelessWidget {
  SearchingTiktok({super.key});

  final SearchingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(DownloadingController());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              "Searching on TikTok ...",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/searchLogo.png',
                width: 100.0,
                height: 100.0,
              ),
              SlideTransition(
                  position: controller.animation,
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey.shade600,
                    size: 100,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
