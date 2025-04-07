import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaka_app/screens/main/home_page.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/auth/login_screen.dart';
import 'package:yaka_app/screens/screens/MyAds.dart';
import 'package:yaka_app/screens/main/post_ad_page.dart';
import 'package:yaka_app/screens/screens/Settings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.onSurfaceColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.settings_outlined, color: AppColors.onSurfaceColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettinsPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            // Profile Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.1),
                            backgroundImage:
                                AssetImage('assets/images/avt.png'),
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Thayagi Perera',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.onSurfaceColor,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'thayagi@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.verified,
                            color: Colors.green,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Verified User',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          // Edit profile action
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          side: BorderSide(color: AppColors.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Stats Card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatColumn('5', 'Active Ads'),
                      _buildVerticalDivider(),
                      _buildStatColumn('12', 'Sold Items'),
                      _buildVerticalDivider(),
                      _buildStatColumn('4.8', 'Rating'),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            // Account Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceColor,
                ),
              ),
            ),
            SizedBox(height: 8),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: [
                  _buildMenuTile(
                    context,
                    Icons.list_alt_rounded,
                    'My Ads',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyAds()),
                      );
                    },
                  ),
                  Divider(height: 1, indent: 70),
                  _buildMenuTile(
                    context,
                    Icons.favorite_border,
                    'Favorites',
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, indent: 70),
                  _buildMenuTile(
                    context,
                    Icons.history,
                    'Recently Viewed',
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Settings Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceColor,
                ),
              ),
            ),
            SizedBox(height: 8),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: [
                  _buildMenuTile(
                    context,
                    Icons.settings,
                    'App Settings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettinsPage()),
                      );
                    },
                  ),
                  Divider(height: 1, indent: 70),
                  _buildMenuTile(
                    context,
                    Icons.help_outline,
                    'Help & Support',
                  ),
                  Divider(height: 1, indent: 70),
                  _buildMenuTile(
                    context,
                    Icons.info_outline,
                    'About YAKA.LK',
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Logout Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: ElevatedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: Icon(Icons.logout),
                label: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildMenuTile(BuildContext context, IconData icon, String title,
      {VoidCallback? onTap, Widget? trailing}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.onSurfaceColor,
        ),
      ),
      trailing: trailing ??
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Log Out'),
          content: Text('Are you sure you want to log out?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('user_logged_in');

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
