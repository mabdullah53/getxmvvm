import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/res/components/round_button.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Login'.tr),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: loginVM.emailController.value,
                        focusNode: loginVM.emailFocusNode.value,
                        validator: (value){
                          //! value null nai honi chihey
                          if(value!.isEmpty){
                            Utils.snakBar('Email', 'Enter email');
                        }
                        },
                        onFieldSubmitted: (value){
                          Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
                        },
                        decoration: InputDecoration(
                            hintText: 'email_hint'.tr,
                            border: OutlineInputBorder()
                        )
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                        controller: loginVM.passwordController.value,
                        focusNode: loginVM.passwordFocusNode.value,
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value){
                          //! value null nai honi chihey
                          if(value!.isEmpty){
                            //ye b text langage m add kry
                            Utils.snakBar('password', 'Enter passwordl');
                          }
                        },
                        onFieldSubmitted: (value){

                        },
                        decoration: InputDecoration(
                            hintText: 'password_hint'.tr,
                            border: OutlineInputBorder()
                        )
                    ),
                  ],
                )
            ),
            SizedBox(height: 40,),

            Obx(() => RoundButton(
                width: 200,
                title: 'Login'.tr,
                loading: loginVM.loading.value,
                onPress: (){
                  if(_formkey.currentState!.validate()){
                    loginVM.loginApi();
                  }
                }
            )),
          ],
        ),
      ) ,
    );
  }
}
