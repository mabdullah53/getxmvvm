import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/res/getx_loclization/languages.dart';
import 'package:getxmvvm/res/routes/routes.dart';
import 'package:getxmvvm/view/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('en' , 'Us'),
      fallbackLocale: Locale('en', 'Us'),
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), //first m name ho ga
      getPages: AppRoutes.appRoutes()
    );
  }
}


