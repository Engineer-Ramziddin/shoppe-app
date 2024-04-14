import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe/configs/configs.dart';
import 'package:shoppe/core/constant/assets.dart';
import 'package:shoppe/core/constant/colors.dart';
import 'package:shoppe/core/router/app_router.dart';
import '../../configs/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.signup,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 134.0,
              height: 134.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.Shadow,
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 92.0,
                  height: 92.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.Splash,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            'Shoppe',
            style: TextStyle(
              color: AppColors.LightText,
              fontSize: 52,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
