import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/auth/login_screen.dart';
import 'package:yaka_app/screens/main/more_page/more_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/my_ads_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/phone_numbers_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/membership_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/sell_fast_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/user_profile_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/saved_searches_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/favorites_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/stay_safe_page.dart';
import 'package:yaka_app/screens/main/profile_page/sub_pages/faq_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          textAlign: TextAlign.left,
          "Account",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: AppColors.backgroundColor,
            ),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
      ),
      body: Expanded(
        child: _buildMenuItems(context),
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 16),
      children: [
        _buildMenuSection(
          "Account",
          [
            _buildMenuItem(
              icon: Icons.person,
              title: "Imesh Madushan",
              subtitle: "View and edit profile",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserProfilePage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.phone_android,
              title: "Phone Numbers",
              subtitle: "Add or remove phone numbers",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PhoneNumbersPage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.star,
              title: "Membership",
              subtitle: "Upgrade to Premium",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MembershipPage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.post_add,
              title: "My Ads",
              subtitle: "Manage your advertisements",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyAdsPage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.favorite,
              title: "Favorites",
              subtitle: "View your favorite items",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritesPage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.saved_search,
              title: "Saved Searches",
              subtitle: "View your saved searches",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedSearchesPage()),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildMenuSection(
          "Settings & Help",
          [
            _buildMenuItem(
              icon: Icons.person_outline,
              title: "My Profile",
              subtitle: "Personal information",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserProfilePage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.shield_outlined,
              title: "Stay safe",
              subtitle: "Safety tips",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StaySafePage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: "FAQ",
              subtitle: "Frequently asked questions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQPage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.flash_on_outlined,
              title: "How to sell fast?",
              subtitle: "Tips for successful selling",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SellFastPage()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.more_horiz,
              title: "More",
              subtitle: "Additional options",
              onTap: () {
                                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MorePage()),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildMenuSection(
          "",
          [
            _buildMenuItem(
              icon: Icons.logout,
              title: "Log out",
              iconColor: Colors.redAccent,
              titleColor: Colors.redAccent,
              showChevron: false,
              onTap: () => _showLogoutDialog(context),
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool showChevron = true,
    Color? iconColor,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (iconColor ?? AppColors.primaryColor).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.primaryColor,
                size: 22,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: titleColor ?? Color(0xFF2D3142),
                    ),
                  ),
                  if (subtitle != null) SizedBox(height: 4),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
            ),
            if (showChevron)
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Log out',
            style: TextStyle(
              color: Color(0xFF2D3142),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: TextStyle(color: Colors.grey[600]),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('user_logged_in');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 0,
              ),
              child: Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }
}
