import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';
import 'package:yaka_app/widgets/custom_button.dart';
import 'package:yaka_app/widgets/custom_text_field.dart';

class PhoneNumbersPage extends StatefulWidget {
  const PhoneNumbersPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumbersPage> createState() => _PhoneNumbersPageState();
}

class _PhoneNumbersPageState extends State<PhoneNumbersPage> {
  // Sample data for phone numbers
  final List<Map<String, dynamic>> _phoneNumbers = [
    {
      'id': '1',
      'number': '+94 77 123 4567',
      'isPrimary': true,
      'isVerified': true,
      'dateAdded': '2023-05-15',
    },
    {
      'id': '2',
      'number': '+94 71 987 6543',
      'isPrimary': false,
      'isVerified': true,
      'dateAdded': '2023-06-02',
    },
    {
      'id': '3',
      'number': '+94 76 555 8888',
      'isPrimary': false,
      'isVerified': false,
      'dateAdded': '2023-07-10',
    },
  ];

  final TextEditingController _phoneController = TextEditingController();
  bool _isAddingNew = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Phone Numbers",
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
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: AppColors.backgroundColor),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: _phoneNumbers.isEmpty && !_isAddingNew
          ? _buildEmptyState()
          : _buildPhoneNumbersList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isAddingNew = true;
          });
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Add new phone number',
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_android,
            size: 120,
            color: Colors.grey[300],
          ),
          SizedBox(height: 24),
          Text(
            'No phone numbers added yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Add a phone number to enhance your account security',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF9A9A9A),
            ),
          ),
          SizedBox(height: 32),
          CustomButton(
            text: "Add Phone Number",
            onPressed: () {
              setState(() {
                _isAddingNew = true;
              });
            },
            width: 200,
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumbersList() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        if (_isAddingNew) _buildAddNewPhoneForm(),
        ..._phoneNumbers.map((phone) => _buildPhoneNumberItem(phone)).toList(),
      ],
    );
  }

  Widget _buildPhoneNumberItem(Map<String, dynamic> phone) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phone['number'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3142),
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          if (phone['isPrimary'])
                            _buildTag('Primary', Colors.blue),
                          if (phone['isPrimary']) SizedBox(width: 8),
                          _buildTag(
                            phone['isVerified'] ? 'Verified' : 'Unverified',
                            phone['isVerified'] ? Colors.green : Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: Color(0xFF9A9A9A)),
                  onSelected: (value) {
                    if (value == 'delete') {
                      _showDeleteConfirmation(context, phone);
                    } else if (value == 'primary') {
                      _setAsPrimary(phone['id']);
                    } else if (value == 'verify') {
                      _verifyPhoneNumber(phone);
                    }
                  },
                  itemBuilder: (context) => [
                    if (!phone['isPrimary'])
                      PopupMenuItem(
                        value: 'primary',
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.blue, size: 20),
                            SizedBox(width: 8),
                            Text('Set as primary'),
                          ],
                        ),
                      ),
                    if (!phone['isVerified'])
                      PopupMenuItem(
                        value: 'verify',
                        child: Row(
                          children: [
                            Icon(Icons.verified_user, color: Colors.green, size: 20),
                            SizedBox(width: 8),
                            Text('Verify number'),
                          ],
                        ),
                      ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red, size: 20),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Color(0xFF9A9A9A),
                ),
                SizedBox(width: 8),
                Text(
                  'Added on ${phone['dateAdded']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9A9A9A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildAddNewPhoneForm() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add New Phone Number",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142),
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _phoneController,
              hintText: "Enter phone number",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    onPressed: () {
                      setState(() {
                        _isAddingNew = false;
                        _phoneController.clear();
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    textColor: Color(0xFF2D3142),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: "Add & Verify",
                    onPressed: () {
                      if (_phoneController.text.isNotEmpty) {
                        _addNewPhoneNumber();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addNewPhoneNumber() {
    // In a real app, this would send a verification code to the phone number
    // and then navigate to a verification screen
    setState(() {
      _phoneNumbers.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'number': _phoneController.text,
        'isPrimary': _phoneNumbers.isEmpty,
        'isVerified': false,
        'dateAdded': DateTime.now().toString().substring(0, 10),
      });
      _isAddingNew = false;
      _phoneController.clear();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Verification code sent to your phone number'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _setAsPrimary(String id) {
    setState(() {
      for (var phone in _phoneNumbers) {
        phone['isPrimary'] = phone['id'] == id;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Primary phone number updated'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _verifyPhoneNumber(Map<String, dynamic> phone) {
    // In a real app, this would show a verification code input dialog
    // For demo purposes, we'll just mark it as verified
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Verify Phone Number'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter the 6-digit code sent to ${phone['number']}'),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Verification code',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                for (var p in _phoneNumbers) {
                  if (p['id'] == phone['id']) {
                    p['isVerified'] = true;
                  }
                }
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Phone number verified successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: Text('Verify'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Map<String, dynamic> phone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Phone Number'),
        content: Text(
          'Are you sure you want to delete this phone number? ${phone['isPrimary'] ? 'This is your primary phone number.' : ''}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: phone['isPrimary']
                ? null
                : () {
                    Navigator.pop(context);
                    setState(() {
                      _phoneNumbers.removeWhere((p) => p['id'] == phone['id']);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Phone number deleted'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              disabledBackgroundColor: Colors.grey,
            ),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: AppColors.primaryColor,
              size: 24,
            ),
            SizedBox(width: 8),
            Text(
              'About Phone Numbers',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF2D3142),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem(
              'Account Security',
              'Phone numbers help secure your account and are used for verification.',
            ),
            SizedBox(height: 12),
            _buildInfoItem(
              'Primary Number',
              'Your primary phone number will be used for important notifications and account recovery.',
            ),
            SizedBox(height: 12),
            _buildInfoItem(
              'Multiple Numbers',
              'You can add multiple phone numbers to your account for convenience.',
            ),
            SizedBox(height: 12),
            _buildInfoItem(
              'Privacy',
              'Your phone numbers are kept private and not shared with other users unless you choose to display them in your ads.',
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text('Got it'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3142),
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9A9A9A),
          ),
        ),
      ],
    );
  }
}