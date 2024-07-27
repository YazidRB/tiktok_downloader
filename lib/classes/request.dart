import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:gallery_saver/gallery_saver.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:tiktok_downloader/controllers/request_controller.dart';
import 'package:tiktok_downloader/classes/request_status.dart';
import 'package:dartz/dartz.dart';
import 'package:tiktok_downloader/controllers/finished_controller.dart';

class RequestHttp {
  RequestController controller = Get.find();

  // send get Request to API , json if secessus , error status otherwise
  Future<Either<RequestStatus, Map<String, dynamic>>> getRequset(
    String authority,
    String unencodedPath,
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  ) async {
    // change status to search
    controller.changeRequest(RequestStatus.search);

    http.Response response = await http.get(
        Uri.https(authority, unencodedPath, queryParameters),
        headers: headers);

    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body));
    } else {
      // change status to error
      controller.changeRequest(RequestStatus.error);
      return const Left(RequestStatus.error);
    }
  }

  // download video by URL
  Future<void> downloadVideo(String url) async {
    // Request permission to access storage
    // if (!await Permission.storage.request().isGranted) {

    try {
      // Get the directory to save the video
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath =
          "${appDocDir.path}${math.Random().nextInt(123123312)}/video.mp4";

      // Start Downloading the video
      Dio dio = Dio();
      controller.changeRequest(RequestStatus.downloading);

      await dio.download(url, savePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          controller.changeProgr((received / total * 100));
        }
      });

      // Start Saving the video in the gallery
      controller.changeRequest(RequestStatus.saving);

      await GallerySaver.saveVideo(savePath);

      FinishedController finishedController = Get.find();
      finishedController.initVideoPlayer(savePath);

      // finish status
      controller.changeRequest(RequestStatus.finished);
    } catch (e) {
      controller.changeRequest(RequestStatus.error);
    }
  }
}
