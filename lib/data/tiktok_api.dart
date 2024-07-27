import 'package:get/get.dart';
import 'package:tiktok_downloader/classes/request.dart';
import 'package:tiktok_downloader/classes/request_status.dart';
import 'package:tiktok_downloader/controllers/downloading_controller.dart';
import 'package:tiktok_downloader/controllers/request_controller.dart';

class Tiktokapi {
  // Api Key
  static const _apiKey = '1adf0d5612msh19e12bdc6cfded2p1496eejsncd88f24c86e4';
  // Api Host
  static const _apiHost = 'tiktok-video-downloader-api.p.rapidapi.com';

  final _headers = {
    'x-rapidapi-key': _apiKey,
    'x-rapidapi-host': _apiHost,
  };

  // crud instance
  final RequestHttp _requestHttp = RequestHttp();
  final _authority = 'tiktok-video-downloader-api.p.rapidapi.com';
  final _unencodedPath = '/media';

  // Download video to the device
  Future<void> getVideo(String url) async {
    RequestController controller = Get.find();

    try {
      // put The user TIKTOK urlin the request
      final Map<String, dynamic> queryParameters = {
        'videoUrl': url,
      };

      //send get request to get JSON response from API ( including the download URL of the video )
      final response = await _requestHttp.getRequset(
        _authority,
        _unencodedPath,
        queryParameters,
        _headers,
      );
      DownloadingController controller = Get.find();

      // create an instance of TIKTOK if a json file is returned
      response.fold((l) {}, (json) async {
        controller.settiktokVideo = json;

        // download the video using URL from Jsom
        await _requestHttp.downloadVideo(json['downloadUrl']);
      });
    } catch (e) {
      controller.changeRequest(RequestStatus.error);
    }
  }
}
