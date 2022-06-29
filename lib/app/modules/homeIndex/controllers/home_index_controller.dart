import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeIndexController extends GetxController {
  var currentIndex = 0.obs;

  List<BottomNavigationBarItem> listTab = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.teal,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.bookmark,
          color: Colors.blueGrey,
        ),
        label: 'Bookmark'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          color: Colors.indigo,
        ),
        label: 'Search')
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
