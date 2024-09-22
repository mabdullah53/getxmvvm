//abstract ka matlab apny aik class create ki and then
//ap osy extend kr lety hn other class m

abstract class BaseApiServices {
  Future<dynamic> getApi(String url); //ye function get api k liye hai

  Future<dynamic> postApi(dynamic data,String url); //ye function post api k liye hai
}