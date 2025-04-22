import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/main/home_page/home_page.dart';
import 'package:yaka_app/screens/main/profile_page/profile_page.dart';
import 'package:yaka_app/screens/main/post_ad_page/post_ad_page.dart';
import 'package:yaka_app/screens/main/chat_page/chat_page.dart';
import 'package:yaka_app/screens/main/serach_page/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const PostAdPage(),
    ChatPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, color: AppColors.primaryColor),
              activeIcon: Icon(Icons.add_circle),
              label: 'Post Ad',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Bootstrap.chat,
                size: 18,
              ),
              activeIcon: Icon(
                Bootstrap.chat_fill,
                size: 18,
              ),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
