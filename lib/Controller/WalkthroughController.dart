import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Widgets/NextPage.dart';

class WalkthroughController extends GetxController {
  var currentPage = 0.obs;

  // Move to the next page
  void nextPage(PageController controller) {
    if (currentPage.value < 2) {
      controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Get.off(NextPage()); // Navigate to the next page after onboarding
    }
  }

  // Skip the onboarding
  void skipWalkthrough() {
    Get.off(NextPage());
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}