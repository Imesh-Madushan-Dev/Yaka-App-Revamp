import 'package:flutter/material.dart';
import 'package:yaka_app/constants/app_colors.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  List<bool> _selectedItems = [false, false]; // Track selected items
  List<int> _itemPrices = [1800, 700]; // Prices of the items
  List<String> _itemTitles = ["Rottweiler Puppies", "MacBook Air 2020"];
  List<String> _itemImages = [
    "assets/images/product2.jpg",
    "assets/images/product4.jpg"
  ];
  List<int> _itemQuantities = [1, 1]; // Initial quantities

  // Calculate total price for selected items
  int get _totalPrice {
    int total = 0;
    for (int i = 0; i < _selectedItems.length; i++) {
      if (_selectedItems[i]) {
        total += _itemPrices[i] * _itemQuantities[i];
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
      _itemQuantities.removeAt(index);
    });
  }

  // Increment quantity
  void _incrementQuantity(int index) {
    setState(() {
      _itemQuantities[index]++;
    });
  }

  // Decrement quantity
  void _decrementQuantity(int index) {
    if (_itemQuantities[index] > 1) {
      setState(() {
        _itemQuantities[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        title: Text(
          "My Cart",
          style: TextStyle(
            color: AppColors.onSurfaceColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (_itemTitles.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_outline, color: AppColors.onSurfaceColor),
              onPressed: () {
                _showClearCartDialog();
              },
            ),
        ],
      ),
      body: _itemTitles.isEmpty
          ? _emptyCartView() // Empty cart message
          : _cartItemView(), // Cart with items
    );
  }

  Widget _emptyCartView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/empty_cart.png", // Replace with actual empty cart image
              height: 150,
              width: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.remove_shopping_cart,
                    size: 100, color: Colors.grey[300]);
              },
            ),
            SizedBox(height: 24),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurfaceColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Time to fill it up with amazing finds!',
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
                'Start Shopping',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartItemView() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _itemTitles.length,
              itemBuilder: (context, index) {
                return _buildCartItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: Row(
        children: [
          Checkbox(
            value: _selectedItems[index],
            activeColor: AppColors.primaryColor,
            onChanged: (value) {
              setState(() {
                _selectedItems[index] = value!;
              });
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              _itemImages[index],
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _itemTitles[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${_itemPrices[index]}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () => _decrementQuantity(index),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${_itemQuantities[index]}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () => _incrementQuantity(index),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.grey),
                      onPressed: () => _removeItem(index),
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

  Widget _buildQuantityButton(
      {required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }

  Widget _buildCheckoutBar() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                '\$${_totalPrice}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed:
                  _selectedItems.contains(true) ? _proceedToCheckout : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                disabledBackgroundColor: Colors.grey[300],
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Checkout (${_selectedItems.where((item) => item).length} items)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _proceedToCheckout() {
    // Implement the checkout process
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Checkout'),
        content: Text('Processing your order...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  void _showClearCartDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Clear Cart'),
        content:
            Text('Are you sure you want to remove all items from your cart?'),
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
                _itemQuantities.clear();
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
