// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_camera/screens/gallery_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 240, 240),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Lottie.asset('assets/images/99220-blue-square-ss.json'),
        ),
      ),
    );
  }

  Future<void> goToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const GalleryScreen()),
        (route) => false);
  }
}
