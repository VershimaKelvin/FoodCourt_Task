import 'package:flutter/material.dart';
import 'package:task/core/constant/app_asset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Image(
            image: AssetImage(AppAssets.splash),
          ),
        ),
    );
  }
}
