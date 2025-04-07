import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/main/home_page.dart';
import 'package:yaka_app/screens/main/profile_page.dart';
import 'package:yaka_app/screens/main/post_ad_page.dart';
import 'package:yaka_app/screens/main/my_cart_Page.dart';
import 'package:yaka_app/screens/main/wishlist_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart'; // Import the bottom navigation package

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 2; // Default to Home page

  // Define pages for navigation
  final List<Widget> _pages = [
    MyCartPage(),
    WishListPage(),
    HomePage(),
    ProfilePage(),
    PostAdPage(),
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
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: _onItemTapped,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryTextColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Wishlist'),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryTextColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryTextColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryTextColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Post Ad'),
            activeColor: AppColors.primaryColor,
            inactiveColor: AppColors.secondaryTextColor,
          ),
        ],
      ),
    );
  }
}
