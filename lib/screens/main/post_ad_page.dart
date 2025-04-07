import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/screens/postAd_sub_pages/location.dart';

class PostAdPage extends StatefulWidget {
  const PostAdPage({super.key});
  @override
  State<PostAdPage> createState() => _PostAdPageState();
}

class _PostAdPageState extends State<PostAdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        title: Text(
          "Post Ad",
          style: TextStyle(
            color: AppColors.onSurfaceColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: AppColors.onSurfaceColor),
            onPressed: () {
              // Show help dialog
              _showHelpDialog();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Banner
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What would you like to sell today?",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Choose a category to get started",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // Popular Categories
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Popular Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurfaceColor,
                  ),
                ),
              ),

              // Categories Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildCategoryButton('Cars', 'assets/images/car.png', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationPage2()),
                      );
                    }),
                    _buildCategoryButton('Motorbikes', 'assets/images/bike.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationPage2()),
                      );
                    }),
                    _buildCategoryButton(
                        'Mobile Phones', 'assets/images/phone.png', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationPage2()),
                      );
                    }),
                    _buildCategoryButton('Property', 'assets/images/pro.png',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationPage2()),
                      );
                    }),
                    _buildCategoryButton(
                        'Home & Garden', 'assets/images/home.png', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationPage2()),
                      );
                    }),
                    _buildCategoryButton('Jobs', 'assets/images/job.png', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationPage2()),
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Other Options
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Other Options",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurfaceColor,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildCustomButton(
                      'Look for something',
                      Icons.search,
                      () {
                        // Navigate to search
                      },
                    ),
                    SizedBox(height: 12),
                    _buildCustomButton(
                      'Sell in other categories',
                      Icons.category,
                      () {
                        // Navigate to all categories
                      },
                    ),
                  ],
                ),
              ),

              // Info Section
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          "Posting Tips",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "• Add clear photos to get more attention\n• Be accurate with your item description\n• Set a competitive price",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Show posting allowance
                      },
                      icon: Icon(Icons.info_outline, size: 18),
                      label: Text('Posting Allowance'),
                      style: TextButton.styleFrom(
                        foregroundColor:
                            AppColors.onSurfaceColor.withOpacity(0.7),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Show posting rules
                      },
                      icon: Icon(Icons.rule, size: 18),
                      label: Text('Posting Rules'),
                      style: TextButton.styleFrom(
                        foregroundColor:
                            AppColors.onSurfaceColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      String title, String imagePath, VoidCallback onTap) {
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
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                imagePath,
                height: 32,
                width: 32,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurfaceColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(String text, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryColor,
              size: 24,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Posting Help'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tips for successful posting:'),
            SizedBox(height: 8),
            Text('• Choose the right category'),
            Text('• Add clear, high-quality photos'),
            Text('• Write detailed descriptions'),
            Text('• Set a competitive price'),
            Text('• Respond quickly to inquiries'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Got it'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
