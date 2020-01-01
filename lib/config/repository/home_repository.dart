import 'dart:developer';

import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';
import 'package:support_ticket/utils/prefer.dart';

class HomeRepository {
  getDashBordData() async {
    var response =
        await NetworkHttps.postRequest(API.homeUrl, {'id': Prefs.getUserID()});
    log("message==> $response");
    return response;
  }
}
