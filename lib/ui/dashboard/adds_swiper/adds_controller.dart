import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'adds_model.dart';

class AdsController extends GetxController {
  final PageController pageController = PageController();
  final List<ImageModel> images = []; // List of images to display
  int currentPage = 0;
  final int itemsToSlide = 1;
  Timer? _autoScrollTimer; // Timer to handle auto-scroll

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll(); // Start auto-scrolling when the controller is initialized
  }

  @override
  void onClose() {
    _autoScrollTimer
        ?.cancel(); // Cancel the timer when the controller is closed
    pageController.dispose(); // Dispose the PageController
    super.onClose();
  }

  // Method to update the list of images
  void setImages(List<ImageModel> newImages) {
    images.clear();
    images.addAll(newImages);
    update();
  }

  // Method to navigate to the next page manually
  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Method to navigate to the previous page manually
  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Private method to start auto-scrolling
  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (pageController.hasClients && images.isNotEmpty) {
        final nextPage = (currentPage + 1) % images.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        currentPage = nextPage; // Update the current page
      }
    });
  }
}
