import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourguide/notification_page.dart';
import 'package:tourguide/profile.dart';

import 'home_page.dart';
import 'search_page.dart';
import 'likes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FINAL',
      theme: ThemeData(useMaterial3: true),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final RxInt currentIndex = 0.obs;

  final pages = [
    const HomePage(),
    const SearchPage(),
    const LikesPage(),
    const NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) => currentIndex.value = index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Likes'),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
