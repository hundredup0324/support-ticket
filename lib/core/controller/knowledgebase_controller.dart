import 'package:get/get.dart';
import 'package:support_ticket/core/model/knowledge_base_response.dart';
import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/view/widget/common_snak_bar_widget.dart';

import '../../view/widget/loading_widget.dart';

class KnowledgeBaseController extends GetxController {
  RxList<KnowLedgeData> knowLedgeList = <KnowLedgeData>[].obs;

  getKnowledgeData() async {
    Loader.showLoader();

    var response = await NetworkHttps.getRequest("${API.knowledges}?workspace_id=${Prefs.getString(AppConstant.workSpaceId)}");

    if (response["status"] == 1) {
      knowLedgeList.clear();
      var responseData = KnowledgeBaseResponse.fromJson(response);
      knowLedgeList.addAll(responseData.data!);
      knowLedgeList.refresh();
    } else {
      commonToast("message");
    }
    Loader.hideLoader();
  }
}
