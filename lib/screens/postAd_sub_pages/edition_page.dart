import 'package:flutter/material.dart';
import 'package:yaka_app/screens/postAd_sub_pages/YearPage.dart';
import 'package:yaka_app/screens/postAd_sub_pages/model_selection.dart';
import 'package:yaka_app/widgets/custom_button.dart';

import '../../../constants/app_colors.dart';

class EditionPage extends StatefulWidget {
  const EditionPage({super.key});

  @override
  State<EditionPage> createState() => _EditionPageState();
}

class _EditionPageState extends State<EditionPage> {
  final TextEditingController _editionController = TextEditingController();
  final List<String> commonEditions = [
    'Base',
    'Sport',
    'Limited',
    'Premium',
    'Luxury',
    'Executive',
    'GT',
    'RS',
  ];

  @override
  void dispose() {
    _editionController.dispose();
    super.dispose();
  }

  void _selectEdition(String edition) {
    _editionController.text = edition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Trim/",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Edition",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor.withOpacity(0.1),
              AppColors.nextColor.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Specify the trim/edition of your car',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _editionController,
                  decoration: InputDecoration(
                    hintText: "Enter trim/edition",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Common Editions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: commonEditions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () => _selectEdition(commonEditions[index]),
                        child: Center(
                          child: Text(
                            commonEditions[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Next",
                onPressed: () {
                  if (_editionController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YearOfManufacturePage(),
                      ),
                    );
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YearOfManufacturePage(),
                    ),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
