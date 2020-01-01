import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';

class FaqRepository {
  getFaqData({int? page, int? perPage}) async {
    var response = await NetworkHttps.getRequest(
        "${API.faqUrl}?workspace_id=${Prefs.getString(AppConstant.workSpaceId)}");
    return response;
  }
}
