import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/main/post_ad_page/post_ad-sub_pages/job_details.dart';
import 'package:yaka_app/screens/main/post_ad_page/post_ad-sub_pages/services_details.dart';

import 'post_ad-sub_pages/electronic_details.dart';
import 'post_ad-sub_pages/vehicale_details.dart';
import 'post_ad-sub_pages/property_details.dart';

class PostAdPage extends StatefulWidget {
  const PostAdPage({super.key});
  @override
  State<PostAdPage> createState() => _PostAdPageState();
}

class _PostAdPageState extends State<PostAdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Post an ad",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose a category to start posting your ad',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Categories Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      childAspectRatio: 0.85,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildCategoryCard(
                          'Vehicles',
                          'assets/images/car.png',
                          Icons.directions_car,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehicleDetailsScreen()),
                          ),
                        ),
                        _buildCategoryCard(
                          'Property',
                          'assets/images/pro.png',
                          Icons.home,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PropertyDetailsScreen()),
                          ),
                        ),
                        _buildCategoryCard(
                          'Electronics',
                          'assets/images/phone.png',
                          Icons.phone_android,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ElectronicsDetailsScreen()),
                          ),
                        ),
                        _buildCategoryCard(
                          'Jobs',
                          'assets/images/job.png',
                          Icons.work,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobDetailsScreen()),
                          ),
                        ),
                        _buildCategoryCard(
                          'Services',
                          'assets/images/service.png',
                          Icons.handyman,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ServicesDetailsScreen()),
                          ),
                        ),
                        _buildCategoryCard(
                          'Fashion',
                          'assets/images/fashion.png',
                          Icons.shopping_bag,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VehicleDetailsScreen()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Other Options
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Other Options',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildOptionButton(
                      'Sell in other Categories',
                      Icons.grid_view,
                      () {},
                    ),
                    SizedBox(height: 12),
                    _buildOptionButton(
                      'Look for Something',
                      Icons.handyman,
                      () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    String title,
    String imagePath,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurfaceColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
