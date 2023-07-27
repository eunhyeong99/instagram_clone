import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/src/components/image_data.dart';
import 'package:instagram_clone/src/controller/bottom_nav_controller.dart';
import 'package:instagram_clone/src/pages/home.dart';
import 'package:instagram_clone/src/pages/search.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              const Search(),
              Container(
                child: Center(child: Text('UPLOAD')),
              ),
              Container(
                child: Center(child: Text('ACTIVITY')),
              ),
              Container(
                child: Center(child: Text('MYPAGE')),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0.0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(
                  icon: IconsPath.homeOff,
                ),
                activeIcon: ImageData(icon: IconsPath.homeOn),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(
                  icon: IconsPath.searchOff,
                ),
                activeIcon: ImageData(icon: IconsPath.searchOn),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: ImageData(
                  icon: IconsPath.uploadIcon,
                ),
                label: 'uploadIcon',
              ),
              BottomNavigationBarItem(
                icon: ImageData(
                  icon: IconsPath.activeOff,
                ),
                activeIcon: ImageData(icon: IconsPath.activeOn),
                label: 'Active',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'Home',
              ),
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
