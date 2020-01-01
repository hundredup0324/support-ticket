import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';
import 'package:support_ticket/utils/prefer.dart';

class LogoutRepository {
  logOutFun() async {
    var response = await NetworkHttps.postRequest(API.logoutUrl, {'id':Prefs.getUserID()});
    return response;
  }

  deleteUser() async {
    var response =await NetworkHttps.postRequest(API.deleteUser,{});
    return response;
  }
}
