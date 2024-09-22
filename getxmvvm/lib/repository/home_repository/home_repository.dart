
import 'package:getxmvvm/data/network/network_api_services.dart';
import 'package:getxmvvm/models/home/user_list_model.dart';
import 'package:getxmvvm/res/app_url/app_url.dart';

class HomeRepository {

  final _apiServices = NetworkApiServices();

  //agr hum data model sy ly rahy han tu phir hum dynmic nai bulk datamodel class
  //ka name likhy gy

  Future<UserListModel> userListApi() async {

    dynamic response = await _apiServices.getApi(AppUrl.userlistApi);
    return UserListModel.fromJson(response);
  }
}