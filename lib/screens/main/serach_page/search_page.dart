import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final String _currentLocation = "All of Sri Lanka";

  // Categories grid data
  final List<Map<String, dynamic>> _categories = [
    {"name": "Electronics", "icon": Icons.phone_android},
    {"name": "Vehicles", "icon": Icons.directions_car},
    {"name": "Property", "icon": Icons.home},
    {"name": "Home & Garden", "icon": Icons.yard},
    {"name": "Animals", "icon": Icons.pets},
    {"name": "Services", "icon": Icons.handyman},
    {"name": "Business & Industry", "icon": Icons.business},
    {"name": "Jobs", "icon": Icons.work},
    {"name": "Hobby, Sport & Kids", "icon": Icons.sports_soccer},
    {"name": "Fashion & Beauty", "icon": Icons.watch},
    {"name": "Essentials", "icon": Icons.shopping_basket},
    {"name": "Education", "icon": Icons.school},
    {"name": "Agriculture", "icon": Icons.agriculture},
    {"name": "Work Overseas", "icon": Icons.work},
    {"name": "Other", "icon": Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildSearchHeader(),
          _buildLocationSelector(),
          Expanded(
            child: _buildCategoriesGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: AppColors.primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "What are you looking for?",
                suffixIcon: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.search, color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: AppColors.primaryColor),
          SizedBox(width: 8),
          Text(
            _currentLocation,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurfaceColor,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              // Change location logic
            },
            child: Text(
              "Change location",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.3,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryItem(
            _categories[index]["name"], _categories[index]["icon"]);
      },
    );
  }

  Widget _buildCategoryItem(String name, IconData icon) {
    return InkWell(
      onTap: () {
        // Navigate to category search results
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]!, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: 25,
              ),
            ),
            SizedBox(height: 12),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
