import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class CategoryItemsPage extends StatefulWidget {
  final String categoryName;
  final IconData categoryIcon;

  const CategoryItemsPage({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });

  @override
  _CategoryItemsPageState createState() => _CategoryItemsPageState();
}

class _CategoryItemsPageState extends State<CategoryItemsPage> {
  final TextEditingController _searchController = TextEditingController();
  final String _currentLocation = "All of Sri Lanka";

  // Sample subcategories for each main category
  final Map<String, List<Map<String, dynamic>>> _subcategories = {
    "Electronics": [
      {"name": "Mobile Phones", "icon": Icons.smartphone},
      {"name": "Mobile Phone Accessories", "icon": Icons.cable},
      {"name": "Computers & Tablets", "icon": Icons.computer},
      {"name": "Computer Accessories", "icon": Icons.keyboard},
      {"name": "TVs", "icon": Icons.tv},
      {"name": "TV & Video Accessories", "icon": Icons.videocam},
      {"name": "Cameras & Camcorders", "icon": Icons.camera_alt},
      {"name": "Audio & MP3", "icon": Icons.headphones},
      {"name": "Electronic Home Appliances", "icon": Icons.kitchen},
      {"name": "Air Conditions & Electrical fittings", "icon": Icons.air},
      {"name": "Video Games & Consoles", "icon": Icons.videogame_asset},
      {"name": "Other Electronics", "icon": Icons.devices_other},
    ],
    "Vehicles": [
      {"name": "Cars", "icon": Icons.directions_car},
      {"name": "Motorcycles", "icon": Icons.motorcycle},
      {"name": "Vans", "icon": Icons.airport_shuttle},
      {"name": "Buses", "icon": Icons.directions_bus},
      {"name": "Trucks", "icon": Icons.local_shipping},
      {"name": "Auto Parts & Accessories", "icon": Icons.build},
    ],
    "Property": [
      {"name": "Houses", "icon": Icons.home},
      {"name": "Apartments", "icon": Icons.apartment},
      {"name": "Land", "icon": Icons.landscape},
      {"name": "Commercial Property", "icon": Icons.business},
      {"name": "Rooms", "icon": Icons.hotel},
      {"name": "Short Term Rentals", "icon": Icons.holiday_village},
    ],
    "Home & Garden": [
      {"name": "Furniture", "icon": Icons.chair},
      {"name": "Home Appliances", "icon": Icons.microwave},
      {"name": "Kitchen & Dining", "icon": Icons.kitchen},
      {"name": "Garden", "icon": Icons.yard},
      {"name": "Home Decor", "icon": Icons.lightbulb},
      {"name": "Tools & DIY", "icon": Icons.handyman},
    ],
    "Animals": [
      {"name": "Dogs", "icon": Icons.pets},
      {"name": "Cats", "icon": Icons.pets},
      {"name": "Birds", "icon": Icons.flutter_dash},
      {"name": "Fish", "icon": Icons.water},
      {"name": "Farm Animals", "icon": Icons.agriculture},
      {"name": "Pet Accessories", "icon": Icons.shopping_bag},
    ],
    "Services": [
      {"name": "Home Services", "icon": Icons.home_repair_service},
      {"name": "Professional Services", "icon": Icons.business_center},
      {"name": "Health & Wellness", "icon": Icons.health_and_safety},
      {"name": "Education & Training", "icon": Icons.school},
      {"name": "Events & Entertainment", "icon": Icons.celebration},
      {"name": "Beauty & Personal Care", "icon": Icons.face},
      {"name": "Repair & Maintenance", "icon": Icons.build},
    ],
    "Business & Industry": [
      {"name": "Office Supplies", "icon": Icons.inventory_2},
      {"name": "Industrial Equipment", "icon": Icons.precision_manufacturing},
      {"name": "Manufacturing", "icon": Icons.factory},
      {"name": "Construction", "icon": Icons.construction},
      {"name": "Retail", "icon": Icons.storefront},
      {"name": "Wholesale", "icon": Icons.inventory},
    ],
    "Jobs": [
      {"name": "IT & Software", "icon": Icons.computer},
      {"name": "Marketing", "icon": Icons.campaign},
      {"name": "Sales", "icon": Icons.point_of_sale},
      {"name": "Customer Service", "icon": Icons.support_agent},
      {"name": "Finance", "icon": Icons.account_balance},
      {"name": "Healthcare", "icon": Icons.medical_services},
      {"name": "Education", "icon": Icons.school},
      {"name": "Engineering", "icon": Icons.engineering},
    ],
    "Hobby, Sport & Kids": [
      {"name": "Sports Equipment", "icon": Icons.sports_soccer},
      {"name": "Musical Instruments", "icon": Icons.music_note},
      {"name": "Books & Magazines", "icon": Icons.book},
      {"name": "Collectibles", "icon": Icons.collections},
      {"name": "Toys & Games", "icon": Icons.toys},
      {"name": "Baby & Kids Items", "icon": Icons.child_care},
    ],
    "Fashion & Beauty": [
      {"name": "Men's Clothing", "icon": Icons.man},
      {"name": "Women's Clothing", "icon": Icons.woman},
      {"name": "Shoes", "icon": Icons.hiking},
      {"name": "Bags & Luggage", "icon": Icons.luggage},
      {"name": "Jewelry & Watches", "icon": Icons.watch},
      {"name": "Beauty Products", "icon": Icons.face_retouching_natural},
    ],
    "Essentials": [
      {"name": "Groceries", "icon": Icons.shopping_basket},
      {"name": "Health & Medicine", "icon": Icons.medical_services},
      {"name": "Household Supplies", "icon": Icons.cleaning_services},
      {"name": "Personal Care", "icon": Icons.spa},
      {"name": "Baby Essentials", "icon": Icons.child_friendly},
    ],
    "Education": [
      {"name": "Textbooks", "icon": Icons.menu_book},
      {"name": "Courses", "icon": Icons.class_},
      {"name": "Tutoring", "icon": Icons.person},
      {"name": "Study Materials", "icon": Icons.note},
      {"name": "Educational Toys", "icon": Icons.extension},
    ],
    "Agriculture": [
      {"name": "Farm Equipment", "icon": Icons.agriculture},
      {"name": "Seeds & Plants", "icon": Icons.grass},
      {"name": "Livestock", "icon": Icons.pets},
      {"name": "Fertilizers & Pesticides", "icon": Icons.science},
      {"name": "Irrigation Systems", "icon": Icons.water_drop},
    ],
    "Work Overseas": [
      {"name": "Jobs Abroad", "icon": Icons.flight},
      {"name": "Visa Services", "icon": Icons.card_membership},
      {"name": "Recruitment Agencies", "icon": Icons.people},
      {"name": "Training for Overseas Jobs", "icon": Icons.school},
      {"name": "Documentation Services", "icon": Icons.description},
    ],
    "Other": [
      {"name": "Miscellaneous Items", "icon": Icons.more_horiz},
      {"name": "Donations", "icon": Icons.volunteer_activism},
      {"name": "Lost & Found", "icon": Icons.search},
      {"name": "Community", "icon": Icons.people},
      {"name": "Announcements", "icon": Icons.campaign},
    ],
  };

  List<Map<String, dynamic>> get _currentSubcategories {
    return _subcategories[widget.categoryName] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildSearchHeader(),
          _buildLocationSelector(),
          _buildCategoryHeader(),
          Expanded(
            child: _buildSubcategoriesList(),
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

  Widget _buildCategoryHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.categoryIcon,
              color: AppColors.primaryColor,
              size: 25,
            ),
          ),
          SizedBox(width: 16),
          Text(
            widget.categoryName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.close, color: Colors.grey[600]),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubcategoriesList() {
    return ListView.builder(
      itemCount: _currentSubcategories.length,
      itemBuilder: (context, index) {
        final subcategory = _currentSubcategories[index];
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              subcategory["icon"] as IconData,
              color: AppColors.primaryColor,
              size: 22,
            ),
          ),
          title: Text(
            subcategory["name"] as String,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          onTap: () {
            // Navigate to subcategory search results
            // You can implement this later
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          tileColor: Colors.white,
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}