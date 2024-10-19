import 'package:ekazi/ui/dashboard/dash.dart';
import 'package:ekazi/ui/splashScreen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/dashboard/adds_swiper/adds_controller.dart';
import 'ui/dashboard/adds_swiper/adds_model.dart';
import 'ui/login/login_view.dart';

void main() {
  final AdsController swiperController = Get.put(AdsController());
  swiperController.setImages([
    ImageModel(imagePath: 'assets/adds/above_beyond1.jpg'),
    ImageModel(imagePath: 'assets/adds/exact_add1.jpg'),
    ImageModel(imagePath: 'assets/adds/think1.jpg'),
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Base design size
      minTextAdapt: true, // Allow text to scale
      splitScreenMode: true, // Split screen support
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ekazi',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFDDE4E4)),
          ),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => SplashScreen()),
            GetPage(name: '/login', page: () => LoginPage()),
            GetPage(name: '/dashboard', page: () => Dashboard()),
          ],
        );
      },
    );
  }
}
