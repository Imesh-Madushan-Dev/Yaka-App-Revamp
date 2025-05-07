import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  // List of FAQ items with questions and answers
  final List<Map<String, String>> _faqItems = [
    {
      'question': 'How do I create an account?',
      'answer': 'You can create an account by clicking on the "Sign Up" button on the login screen. Fill in your details including name, email, and password, then verify your email address to complete the registration process.'
    },
    {
      'question': 'How do I post an ad?',
      'answer': 'To post an ad, click on the "+" button in the bottom navigation bar. Select the appropriate category for your item, fill in all the required details, add photos, and click "Post Ad". Your ad will be reviewed and published shortly.'
    },
    {
      'question': 'How can I edit my ad?',
      'answer': 'To edit your ad, go to your profile page, select "My Ads", find the ad you want to edit, and click on the "Edit" button. Make your changes and save them.'
    },
    {
      'question': 'How do I contact a seller?',
      'answer': 'You can contact a seller by clicking on the "Chat" or "Call" button on their ad page. This will allow you to send a message or make a call directly to the seller.'
    },
    {
      'question': 'How do I search for specific items?',
      'answer': 'Use the search bar at the top of the home page or go to the search tab. Enter keywords related to what you\'re looking for, and you can also filter results by category, price range, and location.'
    },
    {
      'question': 'How do I save a search?',
      'answer': 'After performing a search, click on the "Save Search" button. You can name your search and enable notifications to receive alerts when new items matching your search criteria are posted.'
    },
    {
      'question': 'How do I mark an item as favorite?',
      'answer': 'To mark an item as favorite, click on the heart icon on the ad. You can view all your favorite items by going to your profile and selecting "Favorites".'
    },
    {
      'question': 'What is Yaka Premium Membership?',
      'answer': 'Yaka Premium Membership offers enhanced features such as priority listing, more ad postings, ad statistics, and dedicated support. You can upgrade to Premium from your profile page by selecting "Membership".'
    },
    {
      'question': 'How do I delete my account?',
      'answer': 'To delete your account, go to your profile settings, scroll down to the bottom, and select "Delete Account". You will be asked to confirm this action as it cannot be undone.'
    },
    {
      'question': 'How can I report a suspicious ad or user?',
      'answer': 'If you come across a suspicious ad or user, click on the "Report" button on the ad or user profile. Select the reason for reporting and submit. Our team will review your report and take appropriate action.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Frequently Asked Questions",
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
            _buildIntroSection(),
            SizedBox(height: 16),
            ..._faqItems.map((item) => _buildFAQItem(item)),
            SizedBox(height: 24),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
            "Welcome to Yaka FAQ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Find answers to the most common questions about using Yaka. If you can't find what you're looking for, feel free to contact our support team.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(Map<String, String> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          item['question']!,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.onSurfaceColor,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              item['answer']!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
            "Still have questions?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "If you couldn't find the answer to your question, please contact our support team.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.email_outlined, color: AppColors.primaryColor),
              SizedBox(width: 8),
              Text(
                "support@yaka.lk",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.phone_outlined, color: AppColors.primaryColor),
              SizedBox(width: 8),
              Text(
                "+94 77 123 4567",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}