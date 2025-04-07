import 'package:flutter/material.dart';
import 'package:yaka_app/screens/postAd_sub_pages/YearPage.dart';
import 'package:yaka_app/screens/postAd_sub_pages/model_selection.dart';
import 'package:yaka_app/widgets/custom_button.dart';

import '../../../constants/app_colors.dart';

class EditionPage extends StatelessWidget {
  const EditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Trim/",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " Edition",
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModelSelectionScreen()));
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
                'Where is the trim/edition of your car?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                "assets/images/car.png",
                height: 200,
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.backgroundColor,
                ),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Trim/ Edition",
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YearOfManufacturePage()),
                    );
                  }),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 18,
                        color: AppColors.secondaryTextColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
