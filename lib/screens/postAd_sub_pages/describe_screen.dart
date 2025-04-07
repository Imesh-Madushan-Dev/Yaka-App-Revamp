import 'package:flutter/material.dart';
import 'package:yaka_app/widgets/custom_button.dart';
import '../../../constants/app_colors.dart';
import 'upload_section.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Describe Your Car',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.black,
            onPressed: () {
              // Help action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Car Overview',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: const [
                CustomChip(label: 'Well-maintained'),
                CustomChip(label: 'Low mileage'),
                CustomChip(label: '1st owner'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Key Features',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: const [
                CustomChip(label: 'Leather seats'),
                CustomChip(label: 'Sunroof'),
                CustomChip(label: 'Bluetooth'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Additional Notes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Add anything else buyers should know.",
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "Next",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImageUploadPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
    );
  }
}
