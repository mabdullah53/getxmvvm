import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/data/response/status.dart';
import 'package:getxmvvm/res/colors/app_color.dart';
import 'package:getxmvvm/res/components/general_exception.dart';
import 'package:getxmvvm/res/components/internet_exception_widget.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/view_models/controller/user_preference/user_preference_view.dart';

import '../../view_models/controller/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userlistApi();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(onPressed: (){
            userPreference.removeUser().then((value){
              Get.toNamed(RoutesName.loginView);
            });
          },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());

          case Status.ERROR:
            if(homeController.error.value == 'No internet'){
              return InternetExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
              homeController.userlistApi();
            } else {
              return generalExceptionWidget(onPress: () {
                homeController.refreshApi();
              },);
            }



            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                        ),
                        title: Text(homeController.userList.value.data![index].firstName.toString()),
                       subtitle: Text(homeController.userList.value.data![index].email.toString()),
                      ),
                    );
                  }
              );
        }
      }),
    );
  }
}
