import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';
import 'package:yaka_app/widgets/custom_button.dart';

class ElectronicsDetailsScreen extends StatefulWidget {
  const ElectronicsDetailsScreen({super.key});

  @override
  State<ElectronicsDetailsScreen> createState() =>
      _ElectronicsDetailsScreenState();
}

class _ElectronicsDetailsScreenState extends State<ElectronicsDetailsScreen> {
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _warrantyController = TextEditingController();
  final TextEditingController _specificationsController =
      TextEditingController();

  String? _selectedElectronicsType;
  String? _selectedCondition;
  DateTime? _purchaseDate;

  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  final List<String> electronicsTypes = [
    'Smartphone',
    'Laptop',
    'TV',
    'Camera',
    'Audio',
    'Gaming',
    'Computer Parts',
    'Accessories',
    'Other'
  ];

  final List<String> conditions = [
    'Brand New',
    'Used - Like New',
    'Used - Good',
    'Used - Fair'
  ];

  @override
  void dispose() {
    _provinceController.dispose();
    _districtController.dispose();
    _addressController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _warrantyController.dispose();
    _specificationsController.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage(
      imageQuality: 80,
    );

    if (images != null && images.isNotEmpty) {
      setState(() {
        final newImages = images.map((image) => File(image.path)).toList();
        if (_selectedImages.length + newImages.length > 4) {
          _selectedImages.addAll(newImages.take(4 - _selectedImages.length));
        } else {
          _selectedImages.addAll(newImages);
        }
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _purchaseDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _purchaseDate) {
      setState(() {
        _purchaseDate = picked;
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
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Electronics Details",
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.backgroundColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageUploadSection(),
              _buildTypeSection(),
              _buildFormField(
                title: 'Province',
                controller: _provinceController,
                hint: 'Enter province',
                prefixIcon: Icons.location_city,
              ),
              _buildFormField(
                title: 'District',
                controller: _districtController,
                hint: 'Enter district',
                prefixIcon: Icons.map,
              ),
              _buildFormField(
                title: 'Address',
                controller: _addressController,
                hint: 'Enter address',
                prefixIcon: Icons.home,
                keyboardType: TextInputType.multiline,
              ),
              _buildConditionSection(),
              _buildFormField(
                title: 'Brand',
                controller: _brandController,
                hint: 'Enter brand',
                prefixIcon: Icons.branding_watermark,
              ),
              _buildFormField(
                title: 'Model',
                controller: _modelController,
                hint: 'Enter model',
                prefixIcon: Icons.model_training,
              ),
              _buildDatePicker(),
              _buildFormField(
                title: 'Warranty Information',
                controller: _warrantyController,
                hint: 'Enter warranty details (if any)',
                prefixIcon: Icons.verified_user,
              ),
              _buildFormField(
                title: 'Specifications',
                controller: _specificationsController,
                hint: 'Enter specifications',
                prefixIcon: Icons.description,
                keyboardType: TextInputType.multiline,
              ),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  // Handle form submission
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          value: value,
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

  Widget _buildFormField({
    required String title,
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        CustomTextField(
          hintText: hint,
          controller: controller,
          keyboardType: keyboardType,
          prefixIcon: prefixIcon,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Purchase Date'),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _purchaseDate == null
                      ? 'Select purchase date'
                      : '${_purchaseDate!.day}/${_purchaseDate!.month}/${_purchaseDate!.year}',
                  style: TextStyle(
                    color: _purchaseDate == null
                        ? Colors.grey[400]
                        : AppColors.onSurfaceColor,
                  ),
                ),
                Icon(Icons.calendar_today, color: Colors.grey),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Upload Images'),
        const SizedBox(height: 4),
        Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _selectedImages.isEmpty
              ? GestureDetector(
                  onTap: _pickImages,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo_rounded,
                            color: Colors.grey[400], size: 36),
                        const SizedBox(height: 4),
                        Text(
                          'Add photos (max 4)',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      ..._selectedImages.map(
                        (image) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  image,
                                  height: 130,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedImages.remove(image);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (_selectedImages.length < 4)
                        GestureDetector(
                          onTap: _pickImages,
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          'Add up to 4 images of your Phone',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Electronics Type'),
        _buildDropdown(
          hint: 'Select electronics type',
          value: _selectedElectronicsType,
          items: electronicsTypes,
          onChanged: (String? newValue) {
            setState(() {
              _selectedElectronicsType = newValue;
            });
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildConditionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Condition'),
        _buildDropdown(
          hint: 'Select condition',
          value: _selectedCondition,
          items: conditions,
          onChanged: (String? newValue) {
            setState(() {
              _selectedCondition = newValue;
            });
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
