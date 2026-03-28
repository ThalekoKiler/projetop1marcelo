import 'dart:async';
import '../routes/app_routes.dart';

class SplashViewModel {
  void inicializarSplash(Function(String) onNavegar) {
    Timer(const Duration(seconds: 8), () {
      onNavegar(AppRoutes.login);
    });
  }
}
