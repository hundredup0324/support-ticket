import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';

class ChangePasswordRepository {
  changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    var response = await NetworkHttps.postRequest(API.changePasswordUrl, {
      'old_password': oldPassword,
      'password': newPassword,
      'password_confirmation': confirmPassword
    });
    return response;
  }
}
