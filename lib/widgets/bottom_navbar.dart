import 'package:final_project/controller/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomNavBarController bnbC = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: Obx(
          () => BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 165, 165, 165),
            currentIndex: bnbC.index.value,
            selectedFontSize: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withAlpha(100),
            items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      bnbC.change(0);
                    },
                    icon: const Icon(Icons.home),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      bnbC.change(1);
                    },
                    icon: const Icon(Icons.bookmark),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      bnbC.change(2);
                    },
                    icon: const Icon(Icons.create),
                  ),
                  label: 'Home'),
            ],
          ),
        ),
      ),
    );
  }
}
