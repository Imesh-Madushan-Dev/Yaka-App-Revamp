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
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Post",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " Ad",
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.nextColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "YAKA.LK",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose an option below to post an Ad',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 40),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildCategoryButton('Cars', 'assets/images/car.png', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage2()));
                    }),
                    _buildCategoryButton('Motorbikes', 'assets/images/bike.png',
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage2()));
                    }),
                    _buildCategoryButton(
                        'Mobile Phones', 'assets/images/phone.png', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage2()));
                    }),
                    _buildCategoryButton('Property', 'assets/images/pro.png',
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage2()));
                    }),
                    _buildCategoryButton(
                        'Home & Garden', 'assets/images/home.png', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage2()));
                    }),
                    _buildCategoryButton('Jobs', 'assets/images/job.png', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage2()));
                    }),
                  ],
                ),
                SizedBox(height: 40),
                _buildCustomButton('Look for something'),
                _buildCustomButton('Sell in other categories'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Posting Allowance',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Posting Rules',
                        style: TextStyle(color: AppColors.secondaryTextColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFFEDEDED),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                imagePath,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.secondaryTextColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.nextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.nextColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
