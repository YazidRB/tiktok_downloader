import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/classes/request_status.dart';

class RequestController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController textEditingController;
  RxDouble prog = 0.0.obs;
  RequestStatus requestStatus = RequestStatus.preparing;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void changeProgr(double newProg) {
    prog.value = newProg;
    update();
  }

  void changeRequest(RequestStatus argRequestStatus) {
    requestStatus = argRequestStatus;
    update();
  }

  String? validator() {
    if (textEditingController.text.isEmpty) {
      return "Please add URL first ";
    }

    if (!textEditingController.text.contains('/video/') ||
        !textEditingController.text.contains('tiktok.com') ||
        !textEditingController.text.contains('/@')) {
      return 'invalide TikTok Video URL';
    }

    return null;
  }
}
