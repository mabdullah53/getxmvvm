import 'dart:async';

import 'package:get/get.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/view_models/controller/user_preference/user_preference_view.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();
  void isLogin(){
    userPreference.getUser().then((value){
      print(value.token);
      print(value.isLogin);

      if(value.isLogin == false || value.isLogin.toString() == 'null'){

        Timer(Duration(seconds: 3),
                ()=> Get.toNamed(RoutesName.loginView));

      } else {
        Timer(Duration(seconds: 3),
                ()=> Get.toNamed(RoutesName.homeview));
      }
    });


  }
}