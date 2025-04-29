import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class SavedSearchesPage extends StatefulWidget {
  const SavedSearchesPage({Key? key}) : super(key: key);

  @override
  State<SavedSearchesPage> createState() => _SavedSearchesPageState();
}

class _SavedSearchesPageState extends State<SavedSearchesPage> {
  // Sample data for saved searches
  final List<Map<String, dynamic>> _savedSearches = [
    {
      'id': '1',
      'query': 'iPhone 13 Pro Max',
      'category': 'Electronics',
      'location': 'Colombo',
      'priceRange': 'LKR 200,000 - 300,000',
      'notificationsEnabled': true,
      'dateCreated': '2023-05-15',
      'matchCount': 8,
    },
    {
      'id': '2',
      'query': 'Toyota Prius',
      'category': 'Vehicles',
      'location': 'All Locations',
      'priceRange': 'LKR 6,000,000 - 8,000,000',
      'notificationsEnabled': true,
      'dateCreated': '2023-06-02',
      'matchCount': 12,
    },
    {
      'id': '3',
      'query': 'Apartment for rent',
      'category': 'Property',
      'location': 'Rajagiriya',
      'priceRange': 'LKR 50,000 - 100,000',
      'notificationsEnabled': false,
      'dateCreated': '2023-06-10',
      'matchCount': 5,
    },
    {
      'id': '4',
      'query': 'Software Engineer',
      'category': 'Jobs',
      'location': 'Colombo',
      'priceRange': 'Any',
      'notificationsEnabled': true,
      'dateCreated': '2023-06-15',
      'matchCount': 20,
    },
    {
      'id': '5',
      'query': 'Laptop',
      'category': 'Electronics',
      'location': 'All Locations',
      'priceRange': 'LKR 100,000 - 200,000',
      'notificationsEnabled': false,
      'dateCreated': '2023-06-20',
      'matchCount': 15,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Saved Searches",
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
      body: _savedSearches.isEmpty
          ? _buildEmptyState()
          : _buildSavedSearchesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to search page
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
        tooltip: 'Create new saved search',
      ),
    );
  }

  Widget _buildSavedSearchesList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _savedSearches.length,
      itemBuilder: (context, index) {
        final item = _savedSearches[index];
        return _buildSavedSearchItem(item);
      },
    );
  }

  Widget _buildSavedSearchItem(Map<String, dynamic> item) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    item['query'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "${item['matchCount']} matches",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchDetailRow(
                  Icons.category,
                  "Category",
                  item['category'],
                ),
                SizedBox(height: 8),
                _buildSearchDetailRow(
                  Icons.location_on,
                  "Location",
                  item['location'],
                ),
                SizedBox(height: 8),
                _buildSearchDetailRow(
                  Icons.attach_money,
                  "Price Range",
                  item['priceRange'],
                ),
                SizedBox(height: 8),
                _buildSearchDetailRow(
                  Icons.calendar_today,
                  "Created",
                  item['dateCreated'],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigate to search results
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryColor,
                          side: BorderSide(color: AppColors.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          "View Results",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: item['notificationsEnabled']
                            ? AppColors.primaryColor.withOpacity(0.1)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            item['notificationsEnabled'] = !item['notificationsEnabled'];
                          });
                        },
                        icon: Icon(
                          item['notificationsEnabled']
                              ? Icons.notifications_active
                              : Icons.notifications_off,
                          color: item['notificationsEnabled']
                              ? AppColors.primaryColor
                              : Colors.grey[600],
                        ),
                        tooltip: item['notificationsEnabled']
                            ? 'Disable notifications'
                            : 'Enable notifications',
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _showDeleteConfirmation(context, item);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        tooltip: 'Delete saved search',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        SizedBox(width: 8),
        Text(
          "$label: ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2D3142),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            "No saved searches yet",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3142),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Save your searches to get notified when new matching items are posted",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to search page
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: Icon(Icons.add),
            label: Text(
              "Create Saved Search",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Delete Saved Search',
            style: TextStyle(
              color: Color(0xFF2D3142),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete the saved search "${item['query']}"?',
            style: TextStyle(color: Colors.grey[600]),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _savedSearches.removeWhere((search) => search['id'] == item['id']);
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 0,
              ),
              child: Text(
                'Delete',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: 8),
              Text(
                'About Saved Searches',
                style: TextStyle(
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
                'Get Notifications',
                'Enable notifications to get alerts when new items matching your search criteria are posted.',
              ),
              SizedBox(height: 12),
              _buildInfoItem(
                'Save Time',
                'Quickly access your frequent searches without having to enter the criteria again.',
              ),
              SizedBox(height: 12),
              _buildInfoItem(
                'Stay Updated',
                'Never miss out on new listings that match your interests.',
              ),
              SizedBox(height: 12),
              _buildInfoItem(
                'Manage Your Searches',
                'You can edit, delete or disable notifications for any saved search at any time.',
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 0,
              ),
              child: Text(
                'Got it',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
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
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3142),
          ),
        ),
        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}