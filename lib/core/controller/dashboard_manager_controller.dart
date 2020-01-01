// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:support_ticket/view/screen/home_screen/home_screen.dart';
import 'package:support_ticket/view/screen/knowledgebase/knowledge_base_screen.dart';
import 'package:support_ticket/view/screen/manage_faq_screen.dart';
import 'package:support_ticket/view/screen/setting_screen/setting_screen.dart';
import 'package:support_ticket/view/screen/tickets_screen/tickets_screen.dart';

import '../../utils/images.dart';


class DashBoardManagerController extends GetxController {
  RxInt currantIndex = 2.obs;
  List itemList = [
    {"icon": DefaultImages.ticketsIcn, "title": "Tickets", "screen": TicketsScreen()},
    {"icon": DefaultImages.categoryIcn, "title": "Knowledge", "screen": KnowledgeBaseScreen()},
    {"icon": DefaultImages.homeIcn, "title": "Dashboard", "screen": HomeScreen()},
    {"icon": DefaultImages.userIcn, "title": "Faqs", "screen": ManageFaqScreen()},
    {"icon": DefaultImages.settingIcn, "title": "Settings", "screen": SettingScreen()},
  ];
}
