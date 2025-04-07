import 'package:flutter/material.dart';
import 'package:yaka_app/screens/postAd_sub_pages/condition.dart';
import 'package:yaka_app/screens/postAd_sub_pages/model_selection.dart';

import '../../../constants/app_colors.dart';

class BrandSelectionScreen extends StatelessWidget {
  const BrandSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Br",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "and",
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
                MaterialPageRoute(builder: (context) => ConditionPage()));
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
              SizedBox(height: 30),
              const Text(
                "Select the brand of your car",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1.5),
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.backgroundColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 1.5),
                    ),
                    hintText: "Search for a Brand",
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("Popular Brands",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryTextColor)),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                children: [
                  {"name": "Mitsubishi", "image": "assets/images/brand1.png"},
                  {"name": "Nissan", "image": "assets/images/brand2.png"},
                  {"name": "Suzuki", "image": "assets/images/brand3.png"},
                  {"name": "Honda", "image": "assets/images/brand4.png"},
                  {
                    "name": "Mercedes-Benz",
                    "image": "assets/images/brand5.png"
                  },
                  {"name": "Toyota", "image": "assets/images/brand6.png"}
                ]
                    .map((brand) => _brandTile(
                          brand["name"]!,
                          brand["image"]!,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ModelSelectionScreen(),
                            ));
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 50),
              const Text("All Brands",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryTextColor)),
              Divider(thickness: 3),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _brandListTile("Alfa Romeo");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _brandTile(String brand, String imagePath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.secondaryTextColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.contain),
            SizedBox(height: 5),
            Text(brand,
                style:
                    const TextStyle(fontSize: 15, color: AppColors.nextColor)),
          ],
        ),
      ),
    );
  }

  Widget _brandListTile(String brand) {
    return ListTile(
      title: Text(brand, style: TextStyle(color: Colors.white, fontSize: 18)),
      onTap: () {
        // Handle onTap
      },
    );
  }
}
