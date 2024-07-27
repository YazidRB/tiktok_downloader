import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/controllers/request_controller.dart';
import 'package:tiktok_downloader/data/tiktok_api.dart';
import 'package:tiktok_downloader/widgets/my_button.dart';

class PreparinTiktok extends StatelessWidget {
  PreparinTiktok({super.key});
  final Tiktokapi _tiktokapi = Tiktokapi();

  @override
  Widget build(BuildContext context) {
    // find the Request Controller
    RequestController controller = Get.find();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 150,
          ),
          const Text(
            "T I K T O K     D O W N L O A D E R ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text("Without  WaterMark  For  Free"),
          const Spacer(),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: controller.formKey,
            child: TextFormField(
              validator: (_) => controller.validator(),
              controller: controller.textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade500,
                prefixIcon: const Icon(Icons.link, color: Colors.white),
                hintText: 'Enter your link...',
                hintStyle: const TextStyle(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                errorStyle: const TextStyle(color: Colors.redAccent),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          MyButton(
            title: 'Download Video',
            icon: CupertinoIcons.cloud_download,
            onPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                // unfocus the keyboard
                FocusScope.of(context).unfocus();

                // start downlaoding the video
                await _tiktokapi
                    .getVideo(controller.textEditingController.text);
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
