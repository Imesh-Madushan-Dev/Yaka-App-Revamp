import 'package:flutter/material.dart';
import 'package:yaka_app/screens/main/home_page.dart';
import 'package:yaka_app/screens/screens/LocationPage.dart';
import 'package:yaka_app/screens/main/my_cart_Page.dart';
import 'package:yaka_app/screens/screens/payment_page.dart';
import 'package:yaka_app/screens/postAd_sub_pages/price_page.dart';
import 'constants/app_colors.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/main/main_page.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaka LK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/splash': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        "/Location": (context) => LocationPage(),
        "/cart": (context) => MyCartPage(),
        "/payment": (context) => PaymentPage(),
        // "/sell": (context) => PricePage(),
      },
    );
  }
}
