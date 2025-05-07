import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Help & Support',
      'icon': Icons.help_outline,
      'onTap': (BuildContext context) {
        // Navigate to Help & Support page
      },
    },
    {
      'title': 'About Us',
      'icon': Icons.info_outline,
      'onTap': (BuildContext context) {
        // Navigate to About Us page
      },
    },
    {
      'title': 'Terms & Conditions',
      'icon': Icons.description_outlined,
      'onTap': (BuildContext context) {
        // Navigate to Terms & Conditions page
      },
    },
    {
      'title': 'Privacy Policy',
      'icon': Icons.privacy_tip_outlined,
      'onTap': (BuildContext context) {
        // Navigate to Privacy Policy page
      },
    },
    {
      'title': 'Rate the App',
      'icon': Icons.star_outline,
      'onTap': (BuildContext context) {
        // Open app rating dialog
      },
    },
    {
      'title': 'Share the App',
      'icon': Icons.share_outlined,
      'onTap': (BuildContext context) {
        // Share app functionality
      },
    },
    {
      'title': 'Contact Us',
      'icon': Icons.mail_outline,
      'onTap': (BuildContext context) {
        // Navigate to Contact Us page
      },
    },
    {
      'title': 'Settings',
      'icon': Icons.settings_outlined,
      'onTap': (BuildContext context) {
        // Navigate to Settings page
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "More",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _menuItems.length,
        itemBuilder: (context, index) {
          final item = _menuItems[index];
          return Card(
            elevation: 1,
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: Icon(
                item['icon'] as IconData,
                color: AppColors.primaryColor,
                size: 28,
              ),
              title: Text(
                item['title'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
              onTap: () => item['onTap'](context),
            ),
          );
        },
      ),
    );
  }
}