// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:get/get.dart';
import 'package:support_ticket/config/repository/home_repository.dart';
import 'package:support_ticket/core/model/dashboard_response.dart';
import 'package:support_ticket/network_dio/network_dio.dart';
import 'package:support_ticket/utils/base_api.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/view/screen/auth/login_screen.dart';
import 'package:support_ticket/view/widget/common_snak_bar_widget.dart';
import 'package:support_ticket/view/widget/loading_widget.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  HomeData? homeData;
  RxString openTicket = '0'.obs;
  RxString totalCategories = '0'.obs;
  RxString closeTickets = '0'.obs;

  RxList<YearWiseChart> yearWiseChart = <YearWiseChart>[].obs;
  RxList<ChartDatas> chartData = <ChartDatas>[].obs;

  getHomeApi() async {
    Loader.showLoader();
    var response = await NetworkHttps.getRequest(API.dashboard +
        API.workSpaceId +
        Prefs.getString(AppConstant.workSpaceId));
    if (response['status'] == 1) {
      yearWiseChart.clear();
      chartData.clear();
      var dashResponse = DashboardResponse.fromJson(response);
      homeData = dashResponse.data;
      var homeModelData = dashResponse.data!;
      openTicket.value = homeModelData.openTicket.toString();
      closeTickets.value = homeModelData.closeTicket.toString();
      totalCategories.value = homeModelData.totalCategories.toString();

      yearWiseChart.addAll(homeModelData.yearWiseChart!);
      chartData.addAll(homeModelData.chartDatas!);
      chartData.refresh();
      yearWiseChart.refresh();
    } else {
      commonToast(response["message"]);
    }
    Loader.hideLoader();
  }
}
