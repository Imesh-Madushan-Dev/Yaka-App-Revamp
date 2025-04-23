import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';
import 'package:yaka_app/widgets/custom_button.dart';

class ServicesDetailsScreen extends StatefulWidget {
  const ServicesDetailsScreen({super.key});

  @override
  State<ServicesDetailsScreen> createState() => _ServicesDetailsScreenState();
}

class _ServicesDetailsScreenState extends State<ServicesDetailsScreen> {
  final Map<String, TextEditingController> _controllers = {
    'title': TextEditingController(),
    'description': TextEditingController(),
    'province': TextEditingController(),
    'district': TextEditingController(),
    'address': TextEditingController(),
    'price': TextEditingController(),
    'contactName': TextEditingController(),
    'contactPhone': TextEditingController(),
    'contactEmail': TextEditingController(),
    'website': TextEditingController(),
  };

  String? _selectedServiceType;
  String? _selectedServiceFrequency;
  
  final List<String> serviceTypes = [
    'Home Services',
    'Professional Services',
    'Health & Wellness',
    'Education & Training',
    'Events & Entertainment',
    'Beauty & Personal Care',
    'Repair & Maintenance',
    'IT & Tech Support',
    'Transportation',
    'Financial Services',
    'Other'
  ];
  
  final List<String> serviceFrequencies = [
    'One-time',
    'Hourly',
    'Daily',
    'Weekly',
    'Monthly',
    'Custom'
  ];

  final List<File> _selectedImages = [];
  final int _maxImages = 4;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Service Details",
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
            const SizedBox(height: 16),
            // Basic Information
            _buildSectionTitle("Service Information"),
            CustomTextField(
              hintText: "Service Title",
              controller: _controllers['title'],
              prefixIcon: Icons.miscellaneous_services_outlined,
            ),
            const SizedBox(height: 16),
            
            // Service Type
            _buildDropdown(
              value: _selectedServiceType,
              items: serviceTypes,
              hint: "Service Category",
              onChanged: (value) {
                setState(() {
                  _selectedServiceType = value;
                });
              },
            ),
            
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Service Description",
              controller: _controllers['description'],
              prefixIcon: Icons.description_outlined,
              keyboardType: TextInputType.multiline,
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
            const SizedBox(height: 16),
            _buildDropdown(
              value: _selectedServiceFrequency,
              items: serviceFrequencies,
              hint: "Service Frequency",
              onChanged: (value) {
                setState(() {
                  _selectedServiceFrequency = value;
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Contact Information
            _buildSectionTitle("Contact Information"),
            CustomTextField(
              hintText: "Contact Name",
              controller: _controllers['contactName'],
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Website (Optional)",
              controller: _controllers['website'],
              prefixIcon: Icons.language_outlined,
              keyboardType: TextInputType.url,
            ),
            
            const SizedBox(height: 32),
            
            // Submit Button
            CustomButton(
              text: "Post Service",
              onPressed: () {
                // Implement service posting logic
                if (_validateForm()) {
                  _submitForm();
                }
              },
            ),
            const SizedBox(height: 24),
          ],
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
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.secondaryTextColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: TextStyle(
          color: AppColors.onSurfaceColor,
          fontSize: 16,
        ),
        dropdownColor: Colors.white,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  bool _validateForm() {
    // Basic validation
    if (_controllers['title']!.text.isEmpty) {
      _showValidationError('Please enter a service title');
      return false;
    }
    
    if (_selectedServiceType == null) {
      _showValidationError('Please select a service category');
      return false;
    }
    
    if (_controllers['description']!.text.isEmpty) {
      _showValidationError('Please enter a service description');
      return false;
    }
    
    if (_controllers['contactPhone']!.text.isEmpty) {
      _showValidationError('Please enter a contact phone number');
      return false;
    }
    
    return true;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _submitForm() {
    // Here you would typically send the data to your backend
    // For now, just show a success message and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Service posted successfully!'),
        backgroundColor: Colors.green,
      ),
    );
    
    // Navigate back after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
}