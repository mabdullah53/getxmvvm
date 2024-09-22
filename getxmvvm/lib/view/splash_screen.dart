import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/data/app_exceptions.dart';
import 'package:getxmvvm/res/assets/images.dart';
import 'package:getxmvvm/res/colors/app_color.dart';
import 'package:getxmvvm/res/components/general_exception.dart';
import 'package:getxmvvm/res/components/internet_exception_widget.dart';
import 'package:getxmvvm/res/components/round_button.dart';
import 'package:getxmvvm/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen =  SplashServices();

  @override
  void initState(){
    super.initState();
    splashScreen.isLogin();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Text('welcome_back'.tr,
          textAlign: TextAlign.center,
        ),
      ),



    );
  }
}
