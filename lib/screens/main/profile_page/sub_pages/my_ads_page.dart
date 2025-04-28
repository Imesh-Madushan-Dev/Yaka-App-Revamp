import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class MyAdsPage extends StatefulWidget {
  const MyAdsPage({Key? key}) : super(key: key);

  @override
  State<MyAdsPage> createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final List<Map<String, dynamic>> _activeAds = [
    {
      'title': 'iPhone 13 Pro Max - 256GB',
      'price': 'LKR 275,000',
      'location': 'Colombo',
      'date': '2 days ago',
      'image': 'https://images.unsplash.com/photo-1632661674596-df8be070a5c5?q=80&w=1000&auto=format&fit=crop',
      'views': 45,
      'favorites': 5,
    },
    {
      'title': 'Toyota Prius 2018 - Hybrid',
      'price': 'LKR 8,500,000',
      'location': 'Kandy',
      'date': '1 week ago',
      'image': 'https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=1000&auto=format&fit=crop',
      'views': 120,
      'favorites': 12,
    },
    {
      'title': 'Modern Apartment for Rent',
      'price': 'LKR 45,000/month',
      'location': 'Nugegoda',
      'date': '3 days ago',
      'image': 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=1000&auto=format&fit=crop',
      'views': 78,
      'favorites': 8,
    },
    {
      'title': 'Samsung 55" 4K Smart TV',
      'price': 'LKR 125,000',
      'location': 'Galle',
      'date': '5 days ago',
      'image': 'https://images.unsplash.com/photo-1593784991095-a205069470b6?q=80&w=1000&auto=format&fit=crop',
      'views': 32,
      'favorites': 3,
    },
  ];
  
  final List<Map<String, dynamic>> _inactiveAds = [
    {
      'title': 'Dell XPS 15 Laptop',
      'price': 'LKR 350,000',
      'location': 'Colombo',
      'date': 'Expired 2 weeks ago',
      'image': 'https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?q=80&w=1000&auto=format&fit=crop',
      'views': 67,
      'favorites': 7,
    },
    {
      'title': 'Yamaha FZ-S Motorcycle',
      'price': 'LKR 450,000',
      'location': 'Gampaha',
      'date': 'Expired 1 month ago',
      'image': 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?q=80&w=1000&auto=format&fit=crop',
      'views': 92,
      'favorites': 10,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "My Ads",
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          tabs: [
            Tab(text: "Active (${_activeAds.length})"),
            Tab(text: "Inactive (${_inactiveAds.length})"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAdsList(_activeAds),
          _buildAdsList(_inactiveAds),
        ],
      ),
    );
  }

  Widget _buildAdsList(List<Map<String, dynamic>> ads) {
    return ads.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_alt_outlined,
                  size: 80,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 16),
                Text(
                  'No ads to display',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Post a new ad to get started',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: ads.length,
            itemBuilder: (context, index) {
              final ad = ads[index];
              return _buildAdCard(ad);
            },
          );
  }

  Widget _buildAdCard(Map<String, dynamic> ad) {
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              ad['image'],
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ad['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3142),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  ad['price'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      ad['location'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      ad['date'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    _buildStatItem(Icons.visibility, '${ad['views']} views'),
                    SizedBox(width: 16),
                    _buildStatItem(Icons.favorite, '${ad['favorites']} saves'),
                    Spacer(),
                    _buildActionButton(Icons.edit, 'Edit'),
                    SizedBox(width: 8),
                    _buildActionButton(Icons.delete_outline, 'Delete'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16, color: Colors.grey[700]),
            SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}