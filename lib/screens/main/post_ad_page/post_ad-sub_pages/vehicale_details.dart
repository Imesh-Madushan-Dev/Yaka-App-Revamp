import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';
import 'package:yaka_app/widgets/custom_button.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final Map<String, TextEditingController> _controllers = {
    'province': TextEditingController(),
    'district': TextEditingController(),
    'address': TextEditingController(),
    'brand': TextEditingController(),
    'model': TextEditingController(),
    'trim': TextEditingController(),
    'mileage': TextEditingController(),
    'trimEdition': TextEditingController(),
  };

  String? _selectedVehicleType;
  String? _selectedCondition;
  DateTime? _manufactureYear;

  final List<String> vehicleTypes = [
    'Car',
    'Van',
    'SUV',
    'Truck',
    'Motorcycle',
    'Bus'
  ];
  final List<String> conditions = ['Brand New', 'Used', 'Reconditioned'];

  final List<File> _selectedImages = [];
  final int _maxImages = 4;

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(
      imageQuality: 80,
    );

    if (images.isNotEmpty) {
      setState(() {
        final newImages = images.map((image) => File(image.path)).toList();
        if (_selectedImages.length + newImages.length > _maxImages) {
          _selectedImages.addAll(newImages.take(_maxImages - _selectedImages.length));
        } else {
          _selectedImages.addAll(newImages);
        }
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _manufactureYear ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _manufactureYear) {
      setState(() {
        _manufactureYear = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Vehicle Details",
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.backgroundColor),
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
              
              _buildDropdownField(
                title: 'Vehicle Type',
                hint: 'Select vehicle type',
                value: _selectedVehicleType,
                items: vehicleTypes,
                onChanged: (value) => setState(() => _selectedVehicleType = value),
              ),
              
              _buildFormField(
                title: 'Province',
                hint: 'Enter province',
                controller: _controllers['province']!,
                icon: Icons.location_city,
              ),
              
              _buildFormField(
                title: 'District',
                hint: 'Enter district',
                controller: _controllers['district']!,
                icon: Icons.map,
              ),
              
              _buildFormField(
                title: 'Address',
                hint: 'Enter address',
                controller: _controllers['address']!,
                icon: Icons.home,
                keyboardType: TextInputType.multiline,
              ),
              
              _buildDropdownField(
                title: 'Condition',
                hint: 'Select condition',
                value: _selectedCondition,
                items: conditions,
                onChanged: (value) => setState(() => _selectedCondition = value),
              ),
              
              _buildFormField(
                title: 'Brand',
                hint: 'Enter brand',
                controller: _controllers['brand']!,
                icon: Icons.branding_watermark,
              ),
              
              _buildFormField(
                title: 'Model',
                hint: 'Enter model',
                controller: _controllers['model']!,
                icon: Icons.model_training,
              ),
              
              _buildFormField(
                title: 'Trim / Edition',
                hint: 'Enter trim/edition',
                controller: _controllers['trim']!,
                icon: Icons.edit,
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Manufacture Year'),
                  _buildDateSelector(),
                  const SizedBox(height: 16),
                ],
              ),
              
              _buildFormField(
                title: 'Mileage',
                hint: 'Enter mileage',
                controller: _controllers['mileage']!,
                icon: Icons.speed,
                keyboardType: TextInputType.number,
              ),
              
              _buildFormField(
                title: 'Trim / Edition',
                hint: 'Enter trim/edition',
                controller: _controllers['trimEdition']!,
                icon: Icons.edit_attributes,
              ),
              
              // Submit Button
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
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
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
    required String hint, 
    required TextEditingController controller, 
    required IconData icon, 
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
          prefixIcon: icon,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateSelector() {
    return GestureDetector(
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
              _manufactureYear == null
                  ? 'Select year'
                  : '${_manufactureYear!.year}',
              style: TextStyle(
                color: _manufactureYear == null
                    ? Colors.grey[400]
                    : AppColors.onSurfaceColor,
              ),
            ),
            const Icon(Icons.calendar_today, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Upload Images'),
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
                          'Add photos (max $_maxImages)',
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
                      ..._selectedImages.map(_buildImageTile),
                      if (_selectedImages.length < _maxImages)
                        _buildAddImageTile(),
                    ],
                  ),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          'Add up to $_maxImages images of your vehicle',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildImageTile(File image) {
    return Padding(
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
    );
  }

  Widget _buildAddImageTile() {
    return GestureDetector(
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
    );
  }

  Widget _buildDropdownField({
    required String title,
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        _buildDropdown(
          hint: hint,
          value: value,
          items: items,
          onChanged: onChanged,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

}