
import 'package:get/get.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/view/home/home_view.dart';
import 'package:getxmvvm/view/login/login_view.dart';
import 'package:getxmvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes ()=> [
    GetPage(name: RoutesName.splashScreen,
        page: ()=> SplashScreen(),
    transitionDuration: Duration(microseconds: 250),
    transition: Transition.leftToRightWithFade
    ),

    GetPage(name: RoutesName.loginView,
        page: ()=> LoginView(),
        transitionDuration: Duration(microseconds: 250),
        transition: Transition.leftToRightWithFade
    ),


    GetPage(name: RoutesName.homeview,
        page: ()=> HomeView(),
        transitionDuration: Duration(microseconds: 250),
        transition: Transition.leftToRightWithFade
    ),

  ];
}