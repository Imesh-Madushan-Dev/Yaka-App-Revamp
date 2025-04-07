import 'package:flutter/material.dart';
import 'package:yaka_app/screens/postAd_sub_pages/brand_selection.dart';
import 'package:yaka_app/screens/postAd_sub_pages/location.dart';

import '../../../constants/app_colors.dart';

class ConditionPage extends StatelessWidget {
  const ConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Condi",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "tion",
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LocationPage2()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.nextColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Where is the condition of your car?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                "assets/images/car.png",
                height: 200,
                color: Colors.white,
              ),
              _buildConditionCard(
                context,
                title: 'New',
                subtitle:
                    'Select only if the car is brand new or unregistered.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BrandSelectionScreen(),
                    ),
                  );
                },
              ),
              _buildConditionCard(
                context,
                title: 'Used',
                subtitle:
                    'Select only if the car has been used before and is currently unregistered.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BrandSelectionScreen(),
                    ),
                  );
                },
              ),
              _buildConditionCard(
                context,
                title: 'Reconditioned',
                subtitle: 'Select only if the car has been used before.',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BrandSelectionScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConditionCard(BuildContext context,
      {required String title, required String subtitle, VoidCallback? onTap}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
