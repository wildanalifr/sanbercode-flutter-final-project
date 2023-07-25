import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 165, 165, 165),
        currentIndex: currentTab,
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
                  setState(() {
                    currentTab = 0;
                  });
                },
                icon: const Icon(Icons.home),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                padding: const EdgeInsets.all(15),
                onPressed: () {
                  setState(() {
                    currentTab = 1;
                  });
                },
                icon: const Icon(Icons.bookmark),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: IconButton(
                padding: const EdgeInsets.all(15),
                onPressed: () {
                  setState(() {
                    currentTab = 2;
                  });
                },
                icon: const Icon(Icons.create),
              ),
              label: 'Home'),
        ],
      ),
    );
  }
}
