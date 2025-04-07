import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:yaka_app/screens/postAd_sub_pages/brand_selection.dart';

import '../../../constants/app_colors.dart';
import 'edition_page.dart';

class ModelSelectionScreen extends StatelessWidget {
  const ModelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Mo",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "del",
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
                    builder: (context) => BrandSelectionScreen()));
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              const Text(
                "Select the model of your car",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryTextColor),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.backgroundColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a Model",
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 1.5),
                    ),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("Popular Brands",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryTextColor)),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditionPage(),
                                  ),
                                ),
                            child: const ListTile(
                                title: Text(
                              "318i",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ))),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
