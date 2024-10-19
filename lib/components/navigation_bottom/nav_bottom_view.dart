import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'nav_bottom_controller.dart';

class BottomNavView extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavyBar(
        selectedIndex: controller.selectedIndex.value,
        onItemSelected: (index) {
          if (index != controller.selectedIndex.value) {
            controller.updateIndex(index);
          }
        },
        items: [
          _buildBottomNavyBarItem(
              Icons.home, 'Home', controller.selectedIndex.value == 0),
          _buildBottomNavyBarItem(
              Icons.bookmark, 'Saved', controller.selectedIndex.value == 1),
          _buildBottomNavyBarItem(
              Icons.favorite, 'Favourite', controller.selectedIndex.value == 2),
          _buildBottomNavyBarItem(
              Icons.settings, 'Settings', controller.selectedIndex.value == 3),
        ],
      ),
    );
  }

  BottomNavyBarItem _buildBottomNavyBarItem(
      IconData icon, String title, bool isSelected) {
    return BottomNavyBarItem(
      icon: isSelected
          ? Bounce(
              child: Icon(icon),
            )
          : Icon(icon),
      title: Text(title),
      activeColor: const Color(0xff185198),
      inactiveColor: Colors.grey,
    );
  }
}
