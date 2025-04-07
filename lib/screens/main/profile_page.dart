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
        backgroundColor: Colors.grey[400],
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Profile",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: " Zone",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.nextColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white.withOpacity(0.85),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/avt.png'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thayagi Perera',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: AppColors.primaryColor,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'View your personal details',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            _buildListTile(
              context,
              Icons.list,
              'My Ads',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAds()),
                );
              },
            ),
            // _buildListTile(context, Icons.card_membership, 'My Membership'),
            //  _buildListTile(context, Icons.star, 'Favorites'),
            // _buildListTile(context, Icons.search, 'Saved Searches'),
            _buildListTile(
              context,
              Icons.person,
              'My Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            _buildListTile(
              context,
              Icons.settings,
              'Settings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettinsPage()),
                );
              },
            ),
            Divider(thickness: 4),
            _buildListTile(
              context,
              Icons.exit_to_app,
              'Log Out',
              onTap: () async {
                // Show a confirmation dialog
                bool? confirmLogout = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm Log Out'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text('Log Out'),
                        ),
                      ],
                    );
                  },
                );

                if (confirmLogout == true) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('user_logged_in');

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedScale(
        duration: Duration(milliseconds: 300),
        scale: 1.2,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostAdPage()),
            );
          },
          backgroundColor: AppColors.secondaryTextColor,
          child: Icon(Icons.add, size: 35),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title,
      {VoidCallback? onTap, bool bold = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'Poppins',
          letterSpacing: 1.1,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      onTap: onTap,
    );
  }
}
