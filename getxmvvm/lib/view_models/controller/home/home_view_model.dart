
import 'package:get/get.dart';
import 'package:getxmvvm/data/response/status.dart';
import 'package:getxmvvm/models/home/user_list_model.dart';
import 'package:getxmvvm/repository/home_repository/home_repository.dart';


class HomeController extends GetxController {

  //inctance create
  final _api = HomeRepository();
  //rx islia hai k q k ye getx hai
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;

  void setError(String _value) => error.value = _value;


  void userlistApi() {
    // setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      //ye knsa error a raha hai isloa
      setError(error.toString());
      //error pata krny ka tariqa
      print(error);
      print(stackTrace);
      setRxRequestStatus(Status.ERROR);
    });
    }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      //ye knsa error a raha hai isloa
      setError(error.toString());
      //error pata krny ka tariqa
      print(error);
      print(stackTrace);
      setRxRequestStatus(Status.ERROR);
    });
  }
}