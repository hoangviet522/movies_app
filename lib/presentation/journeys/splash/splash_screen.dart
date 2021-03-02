import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygarment/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: splashController.pageController,
              onPageChanged: splashController.selectedPageIndex,
              itemCount: splashController.splashPage.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        splashController.splashPage[index].imgAsset,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        splashController.splashPage[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 64,
                        ),
                        child: Text(
                          splashController.splashPage[index].desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  splashController.splashPage.length,
                  (index) => Obx(
                    () => Container(
                      margin: EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: splashController.selectedPageIndex.value == index
                            ? Colors.blue
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  splashController.nextPage();
                },
                elevation: 5,
                child: Obx(
                  () => Text(
                    splashController.isLastPage ? "Start" : "Next",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
