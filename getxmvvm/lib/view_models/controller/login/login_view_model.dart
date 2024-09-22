
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/models/login/user_model.dart';
import 'package:getxmvvm/repository/login_repository/login_repository.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/user_preference/user_preference_view.dart';

class LoginViewModel extends GetxController {

  final _api = LoginRepository();
  UserPreference userPreference = UserPreference();

  //obs islia k q k ye change ho sakhty hn
  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs ;
  final passwordFocusNode = FocusNode().obs ;

  RxBool loading = false.obs;

  void loginApi(){
    loading.value = true;
    Map data = {
      'email' : emailController.value.text,
      'password' : passwordController.value.text,
    };
    _api.loginApi(data).then((value){
      loading.value = false;
      if(value['error'] == 'user not found'){
        Utils.snakBar('Login', value['error']);
      } else {
        //instace create
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );
        //ye user ka data store kr rahy hn
        userPreference.saveUser(userModel).then((value){
          Get.delete<LoginViewModel>();
          Get.toNamed(RoutesName.homeview)!.then((value){});

          Utils.snakBar('login', 'login successfully');

        }).onError((error,stackTrace){

        });

      }


    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snakBar('Error', error.toString());

    });

  }

}