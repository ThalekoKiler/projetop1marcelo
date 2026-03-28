import 'package:flutter/material.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _viewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.inicializarSplash((rota) {
      Navigator.pushReplacementNamed(context, rota);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.flash_on,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Meu App (P1)",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
