import 'package:ekazi/ui/dashboard/adds_swiper/adds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddsSection extends StatelessWidget {
  final AdsController controller = Get.find<AdsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsController>(
      builder: (controller) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.images.length,
                    onPageChanged: (page) {
                      controller.currentPage = page;
                      controller.update();
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage(controller.images[index].imagePath),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          (controller.images.length / controller.itemsToSlide)
                              .ceil(),
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: controller.currentPage ~/
                                          controller.itemsToSlide ==
                                      index
                                  ? 12.0
                                  : 8.0,
                              height: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                color: controller.currentPage ~/
                                            controller.itemsToSlide ==
                                        index
                                    ? const Color(0xffbd6325)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
