import 'package:flutter/material.dart';
import 'package:tiktok_downloader/controllers/request_controller.dart';
import 'package:tiktok_downloader/classes/request_status.dart';
import 'package:tiktok_downloader/controllers/finished_controller.dart';
import 'package:tiktok_downloader/controllers/saving_controller.dart';
import 'package:tiktok_downloader/controllers/searching_controller.dart';
import 'package:tiktok_downloader/pages/downloading_tiktok.dart';
import 'package:tiktok_downloader/pages/error_tiktok.dart';
import 'package:tiktok_downloader/pages/finished_tiktok.dart';
import 'package:tiktok_downloader/pages/preparin_tiktok.dart';
import 'package:tiktok_downloader/pages/saving_tiktok.dart';
import 'package:tiktok_downloader/pages/searching_tiktok.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // initialize Controllers
    Get.put(RequestController());
    Get.put(SearchingController());
    Get.put(SavingController());
    Get.put(FinishedController());
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.all(30),
          // change the page depends on the status of the Request
          child: GetBuilder<RequestController>(
              builder: (value) => switch (value.requestStatus) {
                    RequestStatus.preparing => PreparinTiktok(),
                    RequestStatus.error => const ErrorTiktok(),
                    RequestStatus.search => SearchingTiktok(),
                    RequestStatus.downloading => const DownloadingTiktok(),
                    RequestStatus.saving => const SavingTiktok(),
                    RequestStatus.finished => const FinishedTiktok(),
                  }),
        ));
  }
}
