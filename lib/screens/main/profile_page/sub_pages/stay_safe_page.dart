import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class StaySafePage extends StatelessWidget {
  const StaySafePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Stay Safe",
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
            _buildSafetyCard(
              title: "Meeting in Person",
              icon: Icons.people_outline,
              tips: [
                "Meet in public, well-lit places",
                "Bring a friend or tell someone where you're going",
                "Trust your instincts - if something feels wrong, leave",
                "Avoid sharing personal information until you trust the person",
                "Consider video calling before meeting in person"
              ],
            ),
            SizedBox(height: 16),
            _buildSafetyCard(
              title: "Online Transactions",
              icon: Icons.payment_outlined,
              tips: [
                "Verify the seller's identity before paying",
                "Use secure payment methods",
                "Be wary of deals that seem too good to be true",
                "Never send money to someone you haven't met",
                "Check the item thoroughly before completing the transaction"
              ],
            ),
            SizedBox(height: 16),
            _buildSafetyCard(
              title: "Protecting Your Information",
              icon: Icons.security_outlined,
              tips: [
                "Use a strong, unique password for your account",
                "Don't share personal contact details in your ad description",
                "Be careful about the photos you share - they may reveal your location",
                "Report suspicious users immediately",
                "Log out when using shared devices"
              ],
            ),
            SizedBox(height: 16),
            _buildSafetyCard(
              title: "Scam Warning Signs",
              icon: Icons.warning_amber_outlined,
              tips: [
                "Seller refuses to meet in person or show the item",
                "Requests for unusual payment methods",
                "Poor grammar or generic messages",
                "Pressure to act quickly",
                "Requests for additional fees after initial agreement"
              ],
            ),
            SizedBox(height: 16),
            _buildEmergencyContact(),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyCard({
    required String title,
    required IconData icon,
    required List<String> tips,
  }) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: tips.map((tip) => _buildTipItem(tip)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String tip) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.primaryColor,
            size: 18,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyContact() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red[100]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.emergency_outlined,
                color: Colors.red[700],
                size: 24,
              ),
              SizedBox(width: 12),
              Text(
                "Emergency Contacts",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildEmergencyItem(
            title: "Police Emergency",
            contact: "119",
          ),
          SizedBox(height: 8),
          _buildEmergencyItem(
            title: "Ambulance Service",
            contact: "1990",
          ),
          SizedBox(height: 8),
          _buildEmergencyItem(
            title: "Report Fraud",
            contact: "support@yaka.lk",
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyItem({
    required String title,
    required String contact,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        Text(
          contact,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
        ),
      ],
    );
  }
}