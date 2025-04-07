import 'package:flutter/material.dart';
import 'package:yaka_app/widgets/custom_button.dart';
import '../../constants/app_colors.dart';
import 'describe_screen.dart';

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  bool _isNegotiable = false;

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
          'Set Price',
          style: TextStyle(
            color: AppColors.nextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.handshake,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10), // Added space between icon and text
                  Text(
                    "Enter a fair price to\nattract buyers.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
            Text(
              'Enter Selling Price',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Text(
                      'Rs:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "00.00",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: _isNegotiable,
                  onChanged: (bool? value) {
                    setState(() {
                      _isNegotiable = value ?? false;
                    });
                  },
                ),
                Text(
                  'Price is negotiable.',
                  style: TextStyle(color: AppColors.nextColor, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
                text: "Next",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DescriptionPage(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
