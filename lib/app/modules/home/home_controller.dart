import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stays_go/app/data/model/auth_model.dart';
import 'package:stays_go/app/data/model/evaluation_model.dart';
import 'package:stays_go/app/data/model/hotel_model.dart';
import 'package:stays_go/app/data/repository/client_repository.dart';
import 'package:stays_go/app/modules/home/widgets/evaluations.dart';
import 'package:stays_go/app/modules/home/widgets/hotel.dart';
import 'package:stays_go/app/modules/home/widgets/mailConfig.dart';
import 'package:stays_go/app/modules/home/widgets/passwordConfig.dart';
import 'package:stays_go/app/modules/home/widgets/settings.dart';
import 'package:stays_go/app/modules/home/widgets/map.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:stays_go/app/modules/home/widgets/successChanges.dart';
import 'package:stays_go/app/routes/app_routes.dart';
import 'package:stays_go/app/theme/app_theme.dart';

class HomeController extends GetxController {
  final box = GetStorage("stays_go");
  final clientRepository = Get.find<ClientRepository>();

  late String darkMapStyle;

  @override
  void onInit() {
    _loadMapStyles();
    hoteis.add(hotel1);
    hoteis.add(hotel2);
    addMarkers();
    myEvalutations.add(e1);
    myEvalutations.add(e2);
    myEvalutations.add(e2);
    myEvalutations.add(e2);

    Auth auth = Auth.fromJson(box.read("auth"));
    myUsername = auth.username;

    selectedHotel = Hotel(
        hotelName: "Mercure",
        stars: "4",
        preco: "54.6",
        telefone: "948399240",
        distancia: "78",
        rua: "alguma rua",
        codigoPostal: "94283",
        evaluations: [],
        imagePath: "mercure.png",
        servicos: [],
        latLng: LatLng(41.5465981, -8.41987));

    pages = [
      Map(),
      Evaluations(),
      Settings(),
      HotelView(hotel: selectedHotel),
      PasswordConfig(),
      MailConfig(),
      SuccessChanges(),
    ];

    super.onInit();
  }

  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
  }

  // Home
  late Hotel selectedHotel;

  var pages;
  var pageSelected = 0;
  var pageAppBar = 0;

  void changeBTBSelected(int index) {
    pageSelected = index;
    pageAppBar = index;
    if (index == 3) pageAppBar = 0;
    if (index == 4 || index == 5 || index == 6) pageAppBar = 2;
    update();
  }

  //Map
  late BuildContext context;

  double lat = 41.5465981; // change for current position
  double long = -8.41987; // change for current position

  Set<Marker> markers = new Set<Marker>();

  /*
  Marker marker = Marker(
      markerId: new MarkerId("1"),
      position: LatLng(41.5465981, -8.41987),
      infoWindow: InfoWindow(title: "Mércure", snippet: 'Braga/PT'),
      onTap: () {});
  */

  List<Hotel> hoteis = <Hotel>[];
  void addMarkers() {
    hoteis.forEach((element) {
      markers.add(Marker(
          markerId: new MarkerId(element.hotelName),
          position: element.latLng,
          infoWindow: InfoWindow(title: element.hotelName, snippet: 'Braga/PT'),
          onTap: () {
            showHotel(element);
          }));
    });
  }

  void showHotel(Hotel hotel) {
    Scaffold.of(context).showBottomSheet(
      (context) => GestureDetector(
        onTap: () {
          changeHotelSelected(hotel);
          changeBTBSelected(3);
          Navigator.of(context).pop();
        },
        child: SizedBox(
          width: Get.width,
          child: Card(
            color: appThemeData.backgroundColor,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
              child: SingleChildScrollView(
                child: Row(children: [
                  Image.asset("assets/" + hotel.imagePath, scale: 6.5),
                  //Image.network(baseUrl + "/" + hotel.imagePath, scale: 6.5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hotel " + hotel.hotelName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        Row(
                          children: [
                            createCircles(double.parse(hotel.stars)),
                            Text(
                                "  (" +
                                    hotel.evaluations.length.toString() +
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
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                )),
                            Icon(Icons.monetization_on_outlined,
                                color: Colors.grey, size: 12),
                          ],
                        ),
                        SizedBox(height: 3),
                        Text("Distância: " + hotel.distancia + " km",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createCircles(stars) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: [
          if (stars >= 1)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  color: appThemeData.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  border: Border.all(color: appThemeData.buttonColor),
                  color: appThemeData.backgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (stars >= 2)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  color: appThemeData.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  border: Border.all(color: appThemeData.buttonColor),
                  color: appThemeData.backgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (stars >= 3)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  color: appThemeData.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  border: Border.all(color: appThemeData.buttonColor),
                  color: appThemeData.backgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (stars >= 4)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  color: appThemeData.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: Get.width / 36,
                height: Get.width / 36,
                decoration: new BoxDecoration(
                  border: Border.all(color: appThemeData.buttonColor),
                  color: appThemeData.backgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (stars >= 5)
            Container(
              width: Get.width / 36,
              height: Get.width / 36,
              decoration: new BoxDecoration(
                color: appThemeData.buttonColor,
                shape: BoxShape.circle,
              ),
            )
          else
            Container(
              width: Get.width / 36,
              height: Get.width / 36,
              decoration: new BoxDecoration(
                border: Border.all(color: appThemeData.buttonColor),
                color: appThemeData.backgroundColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  int starsChoice = 0;

  Widget createCirclesGesture() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        children: [
          if (starsChoice >= 1)
            GestureDetector(
              onTap: () {
                starsChoice = 1;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: appThemeData.buttonColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                starsChoice = 1;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    border: Border.all(color: appThemeData.buttonColor),
                    color: appThemeData.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          if (starsChoice >= 2)
            GestureDetector(
              onTap: () {
                starsChoice = 2;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    color: appThemeData.buttonColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                starsChoice = 2;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    border: Border.all(color: appThemeData.buttonColor),
                    color: appThemeData.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          if (starsChoice >= 3)
            GestureDetector(
              onTap: () {
                starsChoice = 3;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    color: appThemeData.buttonColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                starsChoice = 3;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    border: Border.all(color: appThemeData.buttonColor),
                    color: appThemeData.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          if (starsChoice >= 4)
            GestureDetector(
              onTap: () {
                starsChoice = 4;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    color: appThemeData.buttonColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                starsChoice = 4;
                update();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  width: Get.width / 26,
                  height: Get.width / 26,
                  decoration: new BoxDecoration(
                    border: Border.all(color: appThemeData.buttonColor),
                    color: appThemeData.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          if (starsChoice >= 5)
            GestureDetector(
              onTap: () {
                starsChoice = 5;
                update();
              },
              child: Container(
                width: Get.width / 26,
                height: Get.width / 26,
                decoration: new BoxDecoration(
                  color: appThemeData.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                starsChoice = 5;
                update();
              },
              child: Container(
                width: Get.width / 26,
                height: Get.width / 26,
                decoration: new BoxDecoration(
                  border: Border.all(color: appThemeData.buttonColor),
                  color: appThemeData.backgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void changeHotelSelected(hotel) {
    pages[3] = HotelView(hotel: hotel);
  }

  //Evaluations
  List<Evaluation> myEvalutations = <Evaluation>[];
  Evaluation e1 = new Evaluation(
      user: "Henrique",
      hotelName: "Dom Vilas",
      stars: "5",
      date: "10/10/2000",
      text: "domVilas.png",
      hotelImagePath: "domVilas.png");
  Evaluation e2 = new Evaluation(
      user: "Henrique",
      hotelName: "Mercure",
      stars: "3",
      date: "10/20/2010",
      text: "bom",
      hotelImagePath: "mercure.png");

  // Hotel
  bool myEvalMode = false;

  void changeEvalMode(mode) {
    myEvalMode = mode;
    update();
  }

  final Hotel hotel1 = Hotel(
      hotelName: "Mercure",
      stars: "4",
      preco: "54.6",
      telefone: "948399240",
      distancia: "78",
      rua: "alguma rua",
      codigoPostal: "94283",
      evaluations: [
        Evaluation(
            user: "Henrique",
            hotelName: "hotel1",
            stars: "3",
            date: "10/20/2010",
            text: "bom",
            hotelImagePath: ""),
        Evaluation(
            user: "José",
            hotelName: "hotel1",
            stars: "5",
            date: "10/10/2000",
            text: "horrível",
            hotelImagePath: ""),
        Evaluation(
            user: "Marcos",
            hotelName: "hotel1",
            stars: "1",
            date: "10/11/2010",
            text: "horrívelmente péssimo",
            hotelImagePath: ""),
        Evaluation(
            user: "Rafael",
            hotelName: "hotel1",
            stars: "2",
            date: "10/5/2000",
            text: "horrível demais",
            hotelImagePath: ""),
      ],
      imagePath: "mercure.png",
      servicos: [
        "Piscina",
        "Pequeno-almoço",
        "Spa",
        "Futebol",
        "Janta",
        "Golf",
        "Ping Pong"
      ],
      latLng: LatLng(41.5465981, -8.41987));

  final Hotel hotel2 = Hotel(
      hotelName: "Dom Vilas",
      stars: "5",
      preco: "64.6",
      telefone: "948385340",
      distancia: "71",
      rua: "Conselheiro Lobato",
      codigoPostal: "94283",
      evaluations: [],
      imagePath: "domVilas.png",
      servicos: ["Piscina"],
      latLng: LatLng(41.5427851, -8.4253537));

  // Settings
  late String myUsername;

  void logout() {
    box.erase();
    Get.offAllNamed(Routes.END);
  }

  // Config password
  final formPasswordConfigKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

  void changePassword() async {
    if (formPasswordConfigKey.currentState!.validate()) {
      try {
        Auth auth = Auth.fromJson(box.read("auth"));
        await clientRepository.updatePassword(auth.username,
            newPasswordController.text, oldPasswordController.text);

        changeBTBSelected(6);
        
        Timer(Duration(seconds: 3), () {
           changeBTBSelected(2);
        });
      } catch (error) {
        Get.defaultDialog(title: "Erro", content: Text(error.toString()));
      }
    }
  }

  // Config email
  final formMailConfigKey = GlobalKey<FormState>();

  TextEditingController oldMailController = TextEditingController();
  TextEditingController newMailController = TextEditingController();
  TextEditingController newMailAgainController = TextEditingController();

  void changeMail() async {
    if (formMailConfigKey.currentState!.validate()) {
      try {
        Auth auth = Auth.fromJson(box.read("auth"));
        await clientRepository.updateEmail(
            auth.username, newMailController.text, oldMailController.text);

        changeBTBSelected(6);
        
        Timer(Duration(seconds: 3), () {
           changeBTBSelected(2);
        });
      } catch (error) {
        Get.defaultDialog(title: "Erro", content: Text(error.toString()));
      }
    }
  }
}
