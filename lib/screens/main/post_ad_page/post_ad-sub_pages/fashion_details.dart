import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';
import 'package:yaka_app/widgets/custom_button.dart';

class FashionDetailsScreen extends StatefulWidget {
  const FashionDetailsScreen({super.key});

  @override
  State<FashionDetailsScreen> createState() => _FashionDetailsScreenState();
}

class _FashionDetailsScreenState extends State<FashionDetailsScreen> {
  final Map<String, TextEditingController> _controllers = {
    'title': TextEditingController(),
    'description': TextEditingController(),
    'province': TextEditingController(),
    'district': TextEditingController(),
    'address': TextEditingController(),
    'price': TextEditingController(),
    'brand': TextEditingController(),
    'size': TextEditingController(),
    'material': TextEditingController(),
    'contactPhone': TextEditingController(),
    'contactEmail': TextEditingController(),
  };

  String? _selectedFashionType;
  String? _selectedGender;
  String? _selectedCondition;

  final List<String> fashionTypes = [
    'Clothing',
    'Shoes',
    'Accessories',
    'Bags',
    'Jewelry',
    'Watches',
    'Traditional Wear',
    'Sportswear',
    'Other'
  ];

  final List<String> genderOptions = [
    'Men',
    'Women',
    'Unisex',
    'Kids',
    'Boys',
    'Girls'
  ];

  final List<String> conditions = [
    'Brand New with Tags',
    'Brand New',
    'Like New',
    'Gently Used',
    'Well Used',
    'Vintage'
  ];

  final List<File> _selectedImages = [];
  final int _maxImages = 5;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        for (var image in images) {
          if (_selectedImages.length < _maxImages) {
            _selectedImages.add(File(image.path));
          } else {
            break;
          }
        }
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurfaceColor,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint:
              Text(hint, style: TextStyle(color: AppColors.secondaryTextColor)),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Fashion Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.backgroundColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.backgroundColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Images section moved to the top
            _buildImagePicker(),

            const SizedBox(height: 24),

            // Basic Information
            _buildSectionTitle("Item Information"),
            CustomTextField(
              hintText: "Item Title",
              controller: _controllers['title'],
              prefixIcon: Icons.title_outlined,
            ),
            const SizedBox(height: 16),

            // Fashion Type
            _buildDropdown(
              value: _selectedFashionType,
              items: fashionTypes,
              hint: "Fashion Category",
              onChanged: (value) {
                setState(() {
                  _selectedFashionType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            // Gender
            _buildDropdown(
              value: _selectedGender,
              items: genderOptions,
              hint: "For Whom",
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Item Description",
              controller: _controllers['description'],
              prefixIcon: Icons.description_outlined,
              keyboardType: TextInputType.multiline,
            ),

            const SizedBox(height: 24),

            // Item Details
            _buildSectionTitle("Item Details"),
            _buildDropdown(
              value: _selectedCondition,
              items: conditions,
              hint: "Condition",
              onChanged: (value) {
                setState(() {
                  _selectedCondition = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Brand",
              controller: _controllers['brand'],
              prefixIcon: Icons.branding_watermark_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Size",
              controller: _controllers['size'],
              prefixIcon: Icons.straighten_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Material",
              controller: _controllers['material'],
              prefixIcon: Icons.texture_outlined,
            ),

            const SizedBox(height: 24),

            // Location Information
            _buildSectionTitle("Location Information"),
            CustomTextField(
              hintText: "Province",
              controller: _controllers['province'],
              prefixIcon: Icons.location_city_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "District",
              controller: _controllers['district'],
              prefixIcon: Icons.map_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Address",
              controller: _controllers['address'],
              prefixIcon: Icons.home_outlined,
              keyboardType: TextInputType.multiline,
            ),

            const SizedBox(height: 24),

            // Pricing Information
            _buildSectionTitle("Pricing Information"),
            CustomTextField(
              hintText: "Price (LKR)",
              controller: _controllers['price'],
              prefixIcon: Icons.attach_money_outlined,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),

            // Contact Information
            _buildSectionTitle("Contact Information"),
            CustomTextField(
              hintText: "Contact Phone",
              controller: _controllers['contactPhone'],
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Contact Email",
              controller: _controllers['contactEmail'],
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 32),

            // Submit Button
            CustomButton(
              text: "Post Fashion Ad",
              onPressed: () {
                // Implement fashion posting logic
                // Validate fields and submit data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fashion ad posted successfully!')),
                );
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Fashion Images (${_selectedImages.length}/$_maxImages)"),
        const SizedBox(height: 8),
        Text(
          "First image will be the cover photo",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 16),
        
        // Image grid with improved design
        if (_selectedImages.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: _selectedImages.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      // Image
                      Image.file(
                        _selectedImages[index],
                        fit: BoxFit.cover,
                      ),
                      
                      // Cover photo indicator for first image
                      if (index == 0)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            color: AppColors.primaryColor.withOpacity(0.7),
                            child: Text(
                              "Cover",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      
                      // Delete button
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () => _removeImage(index),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          
        const SizedBox(height: 16),
        
        // Add image button with improved design
        if (_selectedImages.length < _maxImages)
          InkWell(
            onTap: _pickImages,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 48,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Add Photos (${_selectedImages.length}/$_maxImages)",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Tap to select multiple images",
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
        // Show message when max images reached
        if (_selectedImages.length >= _maxImages)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.amber[700], size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Maximum number of images ($_maxImages) reached",
                    style: TextStyle(
                      color: Colors.amber[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
