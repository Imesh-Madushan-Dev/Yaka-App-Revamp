import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';
import 'package:yaka_app/widgets/custom_button.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final Map<String, TextEditingController> _controllers = {
    'title': TextEditingController(),
    'company': TextEditingController(),
    'location': TextEditingController(),
    'description': TextEditingController(),
    'responsibilities': TextEditingController(),
    'requirements': TextEditingController(),
    'salary': TextEditingController(),
    'contactEmail': TextEditingController(),
    'contactPhone': TextEditingController(),
    'website': TextEditingController(),
  };

  String? _selectedJobType;
  String? _selectedEmploymentType;
  String? _selectedExperienceLevel;
  String? _selectedEducationLevel;
  
  final List<String> jobTypes = [
    'IT & Software',
    'Marketing',
    'Sales',
    'Customer Service',
    'Finance',
    'Healthcare',
    'Education',
    'Engineering',
    'Administrative',
    'Other'
  ];
  
  final List<String> employmentTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Temporary',
    'Internship',
    'Remote'
  ];
  
  final List<String> experienceLevels = [
    'Entry Level',
    'Mid Level',
    'Senior Level',
    'Manager',
    'Executive',
    'No Experience Required'
  ];
  
  final List<String> educationLevels = [
    'High School',
    'Diploma',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'PhD',
    'Certification',
    'No Specific Requirement'
  ];

  final List<File> _selectedImages = [];
  final int _maxImages = 3;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
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
          "Job Details",
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
            _buildSectionTitle("Company Logo/Images (Max $_maxImages)"),
            const SizedBox(height: 8),
            Text(
              "Add your company logo or relevant images",
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _buildImagePicker(),
            
            const SizedBox(height: 24),
            
            // Job Basic Information
            _buildSectionTitle("Job Information"),
            CustomTextField(
              hintText: "Job Title",
              controller: _controllers['title'],
              prefixIcon: Icons.work_outline,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Company Name",
              controller: _controllers['company'],
              prefixIcon: Icons.business_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Location",
              controller: _controllers['location'],
              prefixIcon: Icons.location_on_outlined,
            ),
            
            const SizedBox(height: 24),
            
            // Job Type Section
            _buildSectionTitle("Job Category"),
            _buildDropdown(
              value: _selectedJobType,
              items: jobTypes,
              hint: "Select Job Category",
              onChanged: (value) {
                setState(() {
                  _selectedJobType = value;
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Employment Type Section
            _buildSectionTitle("Employment Type"),
            _buildDropdown(
              value: _selectedEmploymentType,
              items: employmentTypes,
              hint: "Select Employment Type",
              onChanged: (value) {
                setState(() {
                  _selectedEmploymentType = value;
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Job Details Section
            _buildSectionTitle("Job Details"),
            CustomTextField(
              hintText: "Job Description",
              controller: _controllers['description'],
              prefixIcon: Icons.description_outlined,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Responsibilities",
              controller: _controllers['responsibilities'],
              prefixIcon: Icons.assignment_outlined,

            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Requirements",
              controller: _controllers['requirements'],
              prefixIcon: Icons.check_circle_outline,

            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Salary Range (LKR)",
              controller: _controllers['salary'],
              prefixIcon: Icons.attach_money_outlined,
              keyboardType: TextInputType.number,
            ),
            
            const SizedBox(height: 24),
            
            // Experience and Education
            _buildSectionTitle("Experience & Education"),
            _buildDropdown(
              value: _selectedExperienceLevel,
              items: experienceLevels,
              hint: "Experience Level",
              onChanged: (value) {
                setState(() {
                  _selectedExperienceLevel = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildDropdown(
              value: _selectedEducationLevel,
              items: educationLevels,
              hint: "Education Level",
              onChanged: (value) {
                setState(() {
                  _selectedEducationLevel = value;
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Contact Information
            _buildSectionTitle("Contact Information"),
            CustomTextField(
              hintText: "Contact Email",
              controller: _controllers['contactEmail'],
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
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
              hintText: "Company Website (Optional)",
              controller: _controllers['website'],
              prefixIcon: Icons.language_outlined,
              keyboardType: TextInputType.url,
            ),
            
            const SizedBox(height: 32),
            
            // Submit Button
            CustomButton(
              text: "Post Job",
              onPressed: () {
                // Implement job posting logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Job posted successfully!")),
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
                            color: AppColors.primaryColor, size: 36),
                        const SizedBox(height: 4),
                        Text(
                          'Add photos (max $_maxImages)',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
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
          'Add up to $_maxImages images for your job listing',
          style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 12),
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
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: AppColors.primaryColor,
          size: 40,
        ),
      ),
    );
  }
}