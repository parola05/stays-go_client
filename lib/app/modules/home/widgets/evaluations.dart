import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/data/model/evaluation_model.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class Evaluations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: Get.height,
      width: Get.width,
      color: appThemeData.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AS SUAS AVALIAÇÕES",
              style: TextStyle(
                color: appThemeData.buttonColor,
                fontSize: 25,
              ),
            ),
            Text(
              "myUsername",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 15,),
            GetBuilder<HomeController>(
                builder: (controller) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.myEvalutations.length,
                      itemBuilder: (context, index) {
                        Evaluation eval = controller.myEvalutations[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: appThemeData.buttonColor,
                                  height: Get.height / 4,
                                  width: Get.width / 4,
                                ),
                                SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(eval.hotelName,style: TextStyle(color: appThemeData.buttonColor)),
                                    Text(eval.date,style: TextStyle(color: appThemeData.buttonColor)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Container(
                              color: appThemeData.buttonColor,
                              width: Get.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  eval.text,
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                          ],
                        );
                      },
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
