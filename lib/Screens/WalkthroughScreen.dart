import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';

import '../Controller/WalkthroughController.dart';
import '../Models/OnboardingDataModel.dart';
import '../Widgets/Onboarding.dart';
import 'HomeScreen.dart';
import 'WelcomeScreen.dart';

class WalkthroughScreen extends StatelessWidget {
  final WalkthroughController controller = Get.put(WalkthroughController());

  final List<OnboardingData> pages = [
    OnboardingData(
      image: AssetImage("assets/images/r11.png"),
      title: "Welcome to RedRikshaw",
      description: "Our app can send you everywhere, even to space for only \$2.99 per ride.",
    ),
    OnboardingData(
      image: AssetImage("assets/images/r22.png"),
      title: "Book and Enjoy the Ride",
      description: "Book the Auto to your desired Location",
    ),
    OnboardingData(
      image: AssetImage("assets/images/r33.png"),
      title: "Refer and Earn",
      description: "Refer to your friends and family",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) => controller.onPageChanged(index),
                itemBuilder: (context, index) {
                  return OnboardingPage(data: pages[index]);
                },
              ),
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: controller.currentPage.value == 2
                      ? null
                      : () => controller.skipWalkthrough(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "SKIP",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Row(
                  children: List.generate(
                    pages.length,
                        (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 10,
                      width: controller.currentPage.value == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? Colors.orange
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.currentPage.value == 2) {
                      // Navigate to the home page when DONE is pressed
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage(),
                        ),
                      );
                    } else {
                      controller.nextPage(pageController);
                    }
                  },
                  child: Text(
                    controller.currentPage.value == 2 ? "DONE" : "NEXT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}



