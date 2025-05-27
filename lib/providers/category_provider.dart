import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();

  List<Category> _categories = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<Category> get activeCategories =>
      _categories.where((category) => category.status == 1).toList();

  // Fetch all categories
  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final categoryResponse = await _categoryService.getCategories();
      if (categoryResponse != null && categoryResponse.status == 'success') {
        _categories = categoryResponse.categories;
        _errorMessage = null;
      } else {
        _errorMessage = 'Failed to fetch categories';
        _categories = [];
      }
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _categories = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch active categories only
  Future<void> fetchActiveCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final activeCategories = await _categoryService.getActiveCategories();
      _categories = activeCategories;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _categories = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get category by ID
  Category? getCategoryById(int id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get category by URL
  Category? getCategoryByUrl(String url) {
    try {
      return _categories.firstWhere((category) => category.url == url);
    } catch (e) {
      return null;
    }
  }

  // Clear categories and error state
  void clearCategories() {
    _categories = [];
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  // Refresh categories
  Future<void> refreshCategories() async {
    await fetchCategories();
  }
}
