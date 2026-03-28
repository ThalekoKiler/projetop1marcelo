import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';
import 'views/signup_page.dart';
import 'views/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividade Avaliativa',
      initialRoute: AppRoutes.splash, // A tela inicial será a Splash
      routes: {
        AppRoutes.splash: (context) => const SplashPage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signup: (context) => const SignupPage(),
        AppRoutes.home: (context) => const HomePage(),
      },
    );
  }
}
