import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';

class TicketRepository {
  getTicket({
    required int pageNo,
    String? searchPar,
  }) async {
    var response = await NetworkHttps.getRequest(
        API.ticketUrl + API.workSpaceId+ Prefs.getString(AppConstant.workSpaceId)+API.pageUrl + pageNo.toString());
    return response;
  }


  deleteTicket(String ticketId) async {
    var response = await NetworkHttps.postRequest("${API.deleteTicketUrl}/$ticketId", {'workspace_id': Prefs.getString(AppConstant.workSpaceId)});
    return response;
  }


  createTicketData() async {
    var response =await NetworkHttps.getRequest(API.createTicketData + API.workSpaceId + Prefs.getString(AppConstant.workSpaceId));
    return response;

  }
}
