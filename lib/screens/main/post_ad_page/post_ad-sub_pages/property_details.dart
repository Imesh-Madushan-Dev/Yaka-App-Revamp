import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';
import 'package:yaka_app/widgets/custom_button.dart';

class PropertyDetailsScreen extends StatefulWidget {
  const PropertyDetailsScreen({super.key});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  final Map<String, TextEditingController> _controllers = {
    'province': TextEditingController(),
    'district': TextEditingController(),
    'address': TextEditingController(),
    'title': TextEditingController(),
    'description': TextEditingController(),
    'price': TextEditingController(),
    'landSize': TextEditingController(),
    'bedrooms': TextEditingController(),
    'bathrooms': TextEditingController(),
  };

  String? _selectedPropertyType;
  String? _selectedListingType;
  
  final List<String> propertyTypes = [
    'House',
    'Apartment',
    'Land',
    'Commercial Property',
    'Room',
    'Bungalow',
    'Villa'
  ];
  
  final List<String> listingTypes = ['For Sale', 'For Rent', 'To Share'];

  final List<File> _selectedImages = [];
  final int _maxImages = 8;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Property Details",
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
            // Images Section at the top
            _buildSectionTitle("Property Images (Max $_maxImages)"),
            const SizedBox(height: 8),
            Text(
              "Add clear photos of your property to attract more buyers",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _buildImagePicker(),
            
            const SizedBox(height: 24),
            
            // Location Section
            _buildSectionTitle("Location"),
            CustomTextField(
              hintText: "Province",
              controller: _controllers['province'],
              prefixIcon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "District",
              controller: _controllers['district'],
              prefixIcon: Icons.location_city_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Address",
              controller: _controllers['address'],
              prefixIcon: Icons.home_outlined,
            ),
            
            const SizedBox(height: 24),
            
            // Property Type Section
            _buildSectionTitle("Property Type"),
            _buildDropdown(
              value: _selectedPropertyType,
              items: propertyTypes,
              hint: "Select Property Type",
              onChanged: (value) {
                setState(() {
                  _selectedPropertyType = value;
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Listing Type Section
            _buildSectionTitle("Listing Type"),
            _buildDropdown(
              value: _selectedListingType,
              items: listingTypes,
              hint: "Select Listing Type",
              onChanged: (value) {
                setState(() {
                  _selectedListingType = value;
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Property Details Section
            _buildSectionTitle("Property Details"),
            CustomTextField(
              hintText: "Title",
              controller: _controllers['title'],
              prefixIcon: Icons.title_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Description",
              controller: _controllers['description'],
              prefixIcon: Icons.description_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Price (LKR)",
              controller: _controllers['price'],
              prefixIcon: Icons.attach_money_outlined,
              keyboardType: TextInputType.number,
            ),
            
            const SizedBox(height: 24),
            
            // Property Specifications
            _buildSectionTitle("Property Specifications"),
            CustomTextField(
              hintText: "Land Size (perches/acres)",
              controller: _controllers['landSize'],
              prefixIcon: Icons.landscape_outlined,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Bedrooms",
                    controller: _controllers['bedrooms'],
                    prefixIcon: Icons.bed_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    hintText: "Bathrooms",
                    controller: _controllers['bathrooms'],
                    prefixIcon: Icons.bathroom_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Submit Button
            CustomButton(
              text: "Post Ad",
              onPressed: () {
                // Implement ad posting logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Property ad posted successfully!")),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.onSurfaceColor,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text(hint, style: TextStyle(color: AppColors.secondaryTextColor)),
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

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image grid
        if (_selectedImages.isNotEmpty)
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: _selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(_selectedImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
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
        const SizedBox(height: 16),
        // Add image button
        if (_selectedImages.length < _maxImages)
          InkWell(
            onTap: _pickImages,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
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
                    "Add Photos",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}