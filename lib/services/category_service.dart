import 'package:dio/dio.dart';
import '../models/category_model.dart';

class CategoryService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://your-api-base-url.com/api'; // Replace with your actual API base URL

  CategoryService() {
    // Configure Dio
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);

    // Add interceptors for logging if needed
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Fetch all categories
  Future<CategoryResponse?> getCategories() async {
    try {
      final response = await _dio.get('/categories');

      if (response.statusCode == 200) {
        return CategoryResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch categories: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else if (e.response?.statusCode == 404) {
        throw Exception('Categories not found');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // Fetch category by ID
  Future<Category?> getCategoryById(int categoryId) async {
    try {
      final response = await _dio.get('/categories/$categoryId');

      if (response.statusCode == 200) {
        return Category.fromJson(response.data['category']);
      } else {
        throw Exception('Failed to fetch category: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else if (e.response?.statusCode == 404) {
        throw Exception('Category not found');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // Fetch active categories only
  Future<List<Category>> getActiveCategories() async {
    try {
      final categoryResponse = await getCategories();
      if (categoryResponse != null) {
        return categoryResponse.categories
            .where((category) => category.status == 1)
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch active categories: $e');
    }
  }
}
