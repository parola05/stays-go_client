import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stays_go/app/data/base_url.dart';
import 'package:stays_go/app/data/model/evaluation_model.dart';
import 'package:stays_go/app/data/model/hotel_model.dart';
import 'package:stays_go/app/modules/home/home_controller.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class HotelView extends StatelessWidget {
  final Hotel hotel;

  const HotelView({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              height: Get.height,
              width: Get.width,
              color: appThemeData.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              controller.changeEvalMode(false);
                              controller.changeBTBSelected(0);
                            },
                            child: Icon(Icons.arrow_back, color: Colors.white)),
                        Text(
                          "  Hotel " + hotel.hotelName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      //Image.asset("assets/" + hotel.imagePath, scale: 6.5),
                      Image.network(hotel.imagePath, scale: 3.2),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                controller
                                    .createCircles(double.parse(hotel.stars)),
                                Text(
                                    "  (" +
                                        hotel.nEvaluations.toString() +
                                        ")",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Text("Preço: " + hotel.preco + " ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    )),
                                Icon(Icons.monetization_on_outlined,
                                    color: Colors.grey, size: 13),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text("Telefone: " + hotel.telefone,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                )),
                            SizedBox(height: 3),
                            Text("Distância: " +  controller.kmToMt(double.parse(hotel.distancia)).toStringAsFixed(1) + " m",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Rua: " + hotel.rua,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        )),
                    Text("Código Postal: " + hotel.codigoPostal,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Serviços",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: Get.height / 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hotel.servicos.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: appThemeData.buttonColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                      padding: EdgeInsets.all(6),
                                      child: Text(hotel.servicos[index])),
                                ),
                                SizedBox(width: 6),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    controller.myEvalMode == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Avaliações de utilizadores:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  )),
                              ElevatedButton(
                                onPressed: () {
                                  controller.changeEvalMode(true);
                                },
                                child: Text(
                                  'Fazer Avaliação',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: appThemeData.buttonColor,
                                  shape: StadiumBorder(),
                                  fixedSize:
                                      Size(Get.width * 0.4, Get.height * 0.005),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    controller.myEvalMode == false
                        ? FutureBuilder(
                            future: controller.getHotelEvaluations(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasError) {
                                  return Container();
                                } else {
                                  return Expanded(
                                      child: ListView.builder(
                                    itemCount:
                                        controller.hotelEvaluations.length,
                                    itemBuilder: (context, index) {
                                      Evaluation eval =
                                          controller.hotelEvaluations[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(eval.user,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              )),
                                          controller.createCircles(
                                              double.parse(eval.stars)),
                                          Text("Avaliado em: " + eval.date,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              )),
                                          SizedBox(height: 5),
                                          Container(
                                            color: appThemeData.buttonColor,
                                            width: Get.width,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                eval.text,
                                                style: TextStyle(
                                                    color: Colors.black,),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      );
                                    },
                                  ));
                                }
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }
                            ): Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fazer avaliação",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  )),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  controller.createCirclesGesture(),
                                  Text("  (avalie de 1 a 5)",
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                              SizedBox(height: 6),
                              Form(
                                key: controller.evaluationFormKey,
                                child: TextFormField(
                                  controller: controller.evaluationController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Campo requerido';
                                    }
                                    return null;
                                  },
                                  maxLines: 8,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Em que está a pensar?",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.grey[800],
                                    filled: true,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              ElevatedButton(
                                onPressed: () async {
                                  var res = await controller.makeEvaluation();
                                  if (res) controller.changeEvalMode(false);
                                },
                                child: Text(
                                  'Enviar',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: appThemeData.buttonColor,
                                  shape: StadiumBorder(),
                                  fixedSize:
                                      Size(Get.width * 1, Get.height * 0.03),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
