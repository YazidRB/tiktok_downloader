import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_downloader/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Play',
      ),
      home: const HomePage(),
    );
  }
}
