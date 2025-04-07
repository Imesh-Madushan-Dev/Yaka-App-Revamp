import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

import '../../models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _categories = [
    "All",
    "Vehicles",
    "Property",
    "Electronics",
    "Animals"
  ];

  // Define category data
  final List<Map<String, String>> categoryData = [
    {"title": "Vehicles", "imagePath": "assets/images/Vehicles.png"},
    {"title": "Property", "imagePath": "assets/images/Property.png"},
    {"title": "Electronics", "imagePath": "assets/images/Electronics.png"},
    {"title": "Animals", "imagePath": "assets/images/Animals.png"},
    {
      "title": "Furniture",
      "imagePath": "assets/images/Animals.png"
    }, // Replace with correct image
  ];

  // Define featured products data
  final List<Product> featuredProducts = [
    Product(
        title: 'CH-R',
        price: '\$620',
        imagePath: 'assets/images/product3.jpg',
        rating: 4.5),
    Product(
        title: 'House for Sale',
        price: '\$500',
        imagePath: 'assets/images/product1.jpg',
        rating: 4.2),
    Product(
        title: 'Rottweiler Puppies',
        price: '\$170',
        imagePath: 'assets/images/product2.jpg',
        rating: 4.8),
    Product(
        title: 'MacBook Air 2020',
        price: '\$300',
        imagePath: 'assets/images/product4.jpg',
        rating: 4.7),
  ];

  // Define trending products data
  final List<Map<String, String>> trendingProducts = [
    {
      'title': 'Toyota CH-R',
      'price': '\$620',
      'imagePath': 'assets/images/product3.jpg',
      'category': 'Vehicles'
    },
    {
      'title': 'Luxury House',
      'price': '\$500',
      'imagePath': 'assets/images/product1.jpg',
      'category': 'Property'
    },
    {
      'title': 'Rottweiler Puppies',
      'price': '\$170',
      'imagePath': 'assets/images/product2.jpg',
      'category': 'Animals'
    },
    {
      'title': 'MacBook Air 2020',
      'price': '\$300',
      'imagePath': 'assets/images/product4.jpg',
      'category': 'Electronics'
    },
  ];

  // Define search history items
  final List<String> searchHistory = [
    "Toyota Corolla",
    "House for rent",
    "Smartphone",
    "German Shepherd puppies",
  ];

  // Define notifications data
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New offer available',
      'message': '50% off on selected electronics items',
      'time': '10 min ago',
      'isRead': false,
    },
    {
      'title': 'Order confirmed',
      'message': 'Your order #1234 has been confirmed',
      'time': '1 hour ago',
      'isRead': false,
    },
    {
      'title': 'Payment successful',
      'message': 'Your payment for order #1234 was successful',
      'time': '2 hours ago',
      'isRead': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "YAKA",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ".LK",
                style: TextStyle(
                  color: AppColors.onSurfaceColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Badge(
              label: Text("3"),
              child: Icon(Icons.notifications_none,
                  color: AppColors.onSurfaceColor),
            ),
            onPressed: () {
              _showNotificationsPanel();
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: AppColors.onSurfaceColor),
            onPressed: () {
              _showSearchModal(context);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        onRefresh: () async {
          // Implement refresh functionality
          await Future.delayed(Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotional Banner
              _buildPromotionalBanner(),

              // Categories Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurfaceColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // View all categories
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              _buildCategoriesSection(),

              // Featured Products Section
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Products",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurfaceColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // View all products
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildProductsGrid(),

              // Trending Section
              Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Now",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurfaceColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // View all trending items
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildTrendingProducts(),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "55% Discount",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonTextColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "On selected items!",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.buttonTextColor.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to promotional items
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text("Shop Now"),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/image6.png",
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: categoryData.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(
              categoryData[index]["title"]!, categoryData[index]["imagePath"]!);
        },
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 50,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: AppColors.onSurfaceColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 220, // Fixed height to prevent overflow
      ),
      padding: EdgeInsets.all(16),
      itemCount: featuredProducts.length,
      itemBuilder: (context, index) {
        return _buildProductCard(
          featuredProducts[index].title,
          featuredProducts[index].price,
          featuredProducts[index].imagePath,
          featuredProducts[index].rating,
        );
      },
    );
  }

  Widget _buildTrendingProducts() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: trendingProducts.length,
        itemBuilder: (context, index) {
          return _buildTrendingCard(
            trendingProducts[index]['title']!,
            trendingProducts[index]['price']!,
            trendingProducts[index]['imagePath']!,
            trendingProducts[index]['category']!,
          );
        },
      ),
    );
  }

  Widget _buildTrendingCard(
      String title, String price, String imagePath, String category) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.onSurfaceColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      String title, String price, String imagePath, double rating) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    icon: Icon(Icons.favorite_border,
                        color: AppColors.primaryColor),
                    onPressed: () {
                      // Add to wishlist
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: AppColors.onSurfaceColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.onSurfaceColor,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search for products...',
                  prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Recent Searches",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Clear All",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return _buildSearchHistoryItem(searchHistory[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHistoryItem(String query) {
    return ListTile(
      leading: Icon(Icons.history, color: Colors.grey),
      title: Text(query),
      trailing: Icon(Icons.north_west, size: 16, color: Colors.grey),
      onTap: () {
        // Search with this query
        Navigator.pop(context);
      },
    );
  }

  void _showNotificationsPanel() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Mark all as read",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return _buildNotificationItem(
                    title: notifications[index]['title'],
                    message: notifications[index]['message'],
                    time: notifications[index]['time'],
                    isRead: notifications[index]['isRead'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String message,
    required String time,
    required bool isRead,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isRead ? Colors.white : Colors.grey[50],
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: EdgeInsets.only(top: 5, right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isRead ? Colors.transparent : AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }
}
