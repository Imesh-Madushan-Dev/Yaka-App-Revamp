import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  List<bool> _selectedItems = [false, false]; // Track selected items
  List<int> _itemPrices = [1800, 4500]; // Prices of the items
  List<String> _itemTitles = ["Rottweiler Puppies", "MacBook Air 2020"];
  List<String> _itemImages = [
    "assets/images/product2.jpg",
    "assets/images/product4.jpg"
  ];

  // Calculate total price for selected items
  int get _totalPrice {
    int total = 0;
    for (int i = 0; i < _selectedItems.length; i++) {
      if (_selectedItems[i]) {
        total += _itemPrices[i];
      }
    }
    return total;
  }

  // Remove an item
  void _removeItem(int index) {
    setState(() {
      _itemPrices.removeAt(index);
      _itemTitles.removeAt(index);
      _itemImages.removeAt(index);
      _selectedItems.removeAt(index);
    });
  }

  void _moveToCart(int index) {
    // Here you would implement logic to add the item to cart
    // For now, we'll just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_itemTitles[index]} added to cart'),
        action: SnackBarAction(
          label: 'VIEW CART',
          onPressed: () {
            // Navigation will be handled by bottom nav bar
          },
        ),
      ),
    );
  }

  void _moveAllToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('All selected items added to cart'),
        action: SnackBarAction(
          label: 'VIEW CART',
          onPressed: () {
            // Navigation will be handled by bottom nav bar
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        title: Text(
          "My Wishlist",
          style: TextStyle(
            color: AppColors.onSurfaceColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (_itemTitles.isNotEmpty)
            IconButton(
              icon: Icon(Icons.shopping_cart_checkout,
                  color: AppColors.onSurfaceColor),
              onPressed: () {
                _moveAllToCart();
              },
              tooltip: 'Add all to cart',
            ),
          if (_itemTitles.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_outline, color: AppColors.onSurfaceColor),
              onPressed: () {
                _showClearWishlistDialog();
              },
            ),
        ],
      ),
      body: _itemTitles.isEmpty
          ? _emptyWishlistView() // Empty wishlist message
          : _wishlistItemView(), // Wishlist with items
    );
  }

  Widget _emptyWishlistView() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/empty_wishlist.png", // Replace with actual empty wishlist image
              height: 150,
              width: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.favorite_border,
                    size: 100, color: Colors.grey[300]);
              },
            ),
            SizedBox(height: 24),
            Text(
              'Your wishlist is empty',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurfaceColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Save items you love to shop them later',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Find the parent Navigator's context first
                final mainNavContext =
                    Navigator.of(context, rootNavigator: true).context;
                // Then tell the parent MainPage to switch to the home tab (index 2)
                if (mainNavContext != null) {
                  Navigator.of(mainNavContext).pushNamedAndRemoveUntil(
                    '/',
                    (route) => false,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 2,
              ),
              child: Text(
                'Discover Products',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _wishlistItemView() {
    return Container(
      color: Colors.grey[100],
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _itemTitles.length,
        itemBuilder: (context, index) {
          return _buildWishlistItem(index);
        },
      ),
    );
  }

  Widget _buildWishlistItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
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
                  _itemImages[index],
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: () => _removeItem(index),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _itemTitles[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurfaceColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  '\$${_itemPrices[index]}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => _moveToCart(index),
                  icon: Icon(Icons.shopping_cart, size: 16),
                  label: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showClearWishlistDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear Wishlist'),
        content: Text('Are you sure you want to clear your wishlist?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _itemPrices.clear();
                _itemTitles.clear();
                _itemImages.clear();
                _selectedItems.clear();
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }
}
