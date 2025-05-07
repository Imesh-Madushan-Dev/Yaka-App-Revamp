import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class SellFastPage extends StatelessWidget {
  const SellFastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "How to Sell Fast",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildTipSection(
              title: "Create an Attractive Listing",
              icon: Icons.photo_camera_outlined,
              tips: [
                "Use high-quality photos from multiple angles",
                "Write a detailed, honest description",
                "Highlight unique features and benefits",
                "Include measurements and specifications",
                "Mention any warranties or guarantees"
              ],
            ),
            SizedBox(height: 16),
            _buildTipSection(
              title: "Price it Right",
              icon: Icons.attach_money,
              tips: [
                "Research similar items to set a competitive price",
                "Consider offering a slight discount compared to retail",
                "Be open to reasonable negotiations",
                "Highlight value for money in your description",
                "Consider seasonal demand when pricing"
              ],
            ),
            SizedBox(height: 16),
            _buildTipSection(
              title: "Boost Visibility",
              icon: Icons.visibility_outlined,
              tips: [
                "Use relevant keywords in your title and description",
                "Select the correct category and subcategory",
                "Consider upgrading to a premium listing",
                "Share your listing on social media",
                "Renew your listing periodically to stay at the top"
              ],
            ),
            SizedBox(height: 16),
            _buildTipSection(
              title: "Respond Quickly",
              icon: Icons.chat_bubble_outline,
              tips: [
                "Reply to inquiries within a few hours",
                "Be polite and professional in all communications",
                "Answer questions thoroughly",
                "Be available for viewings or demonstrations",
                "Consider offering delivery options"
              ],
            ),
            SizedBox(height: 16),
            _buildTipSection(
              title: "Build Trust",
              icon: Icons.verified_user_outlined,
              tips: [
                "Complete your profile with real information",
                "Verify your phone number and email",
                "Be honest about any flaws or issues",
                "Provide proof of purchase when possible",
                "Maintain positive ratings and reviews"
              ],
            ),
            SizedBox(height: 24),
            _buildPremiumTip(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sell Your Items Faster!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Follow these proven tips to make your listings stand out and sell quickly on Yaka.lk",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipSection({
    required String title,
    required IconData icon,
    required List<String> tips,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 24,
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          ...tips.map((tip) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        tip,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPremiumTip() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pro Tip: Upgrade to Premium",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Premium listings get up to 5x more views and sell 70% faster on average. Consider upgrading your listing for maximum visibility.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Explore Premium Options",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}