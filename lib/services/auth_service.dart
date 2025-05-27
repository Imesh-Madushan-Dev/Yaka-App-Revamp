import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://yakalk.esupportsystem.shop/api';

  // Register a new user
  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/register',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );

      // Handle the specific JSON response format
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['status'] == 'success') {
          // Store user data
          final userData = response.data['user'];

          // For this API, we don't directly get a token in the registration response,
          // but we could generate a token from the user data if needed
          // For now, we'll just store a marker that the user is authenticated
          await _saveAuthStatus(true);

          return {
            'success': true,
            'message': response.data['message'] ?? 'Registration successful',
            'data': userData
          };
        } else {
          return {
            'success': false,
            'message': response.data['message'] ?? 'Registration failed'
          };
        }
      } else {
        return {
          'success': false,
          'message': response.data['message'] ?? 'Registration failed'
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Network error occurred'
      };
    }
  }

  // Login user
  Future<Map<String, dynamic>> login({
    required String login,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login',
        data: {
          'login': login,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Check if the status is success based on auth.md format
        if (response.data['status'] == 'success') {
          // Save the token and set authentication status
          if (response.data['token'] != null) {
            await _saveToken(response.data['token']);
            await _saveAuthStatus(true);
          }
          return {
            'success': true,
            'data': response.data,
            'message': response.data['message'] ?? 'Login successful'
          };
        } else {
          return {
            'success': false,
            'message': response.data['message'] ?? 'Authentication failed'
          };
        }
      } else {
        return {
          'success': false,
          'message': response.data['message'] ?? 'Authentication failed'
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'message': e.response?.data?['message'] ?? 'Network error occurred'
      };
    }
  }

  // Logout user
  Future<bool> logout() async {
    try {
      final token = await getToken();
      if (token != null) {
        // You can add an API call to invalidate the token on the server
        // final response = await _dio.post(
        //   '$_baseUrl/logout',
        //   options: Options(headers: {'Authorization': 'Bearer $token'}),
        // );
      }

      // Clear the token from local storage
      await _clearToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final authStatus = await getAuthStatus();
    return authStatus;
  }

  // Get authentication status
  Future<bool> getAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_authenticated') ?? false;
  }

  // Save authentication status
  Future<void> _saveAuthStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_authenticated', status);
  }

  // Get current user token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Save the token to shared preferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Clear the token from shared preferences
  Future<void> _clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('is_authenticated');
  }
}
