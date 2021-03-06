import 'package:falckonfirecommander/controller/user_controller.dart';
import 'package:falckonfirecommander/materials/buttons.dart';
import 'package:falckonfirecommander/materials/cards.dart';
import 'package:falckonfirecommander/materials/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EkipmanTanimlariPage extends StatefulWidget {
  const EkipmanTanimlariPage({Key? key}) : super(key: key);

  @override
  _EkipmanTanimlariPageState createState() => _EkipmanTanimlariPageState();
}

class _EkipmanTanimlariPageState extends State<EkipmanTanimlariPage> {
  final UserController _userController = Get.find();
  ScrollController _scrollController = ScrollController();
  bool isVisible = false;
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Color(AppColors.blacktextcolor),
            ),
          ),
        ],
        title: Text(
          "EKİPMAN TANIMLARI",
          style: TextStyle(
              fontFamily: 'OpenSans',
              color: Color(AppColors.blacktextcolor),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(AppColors.themecolor),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          color: Color(AppColors.blacktextcolor),
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30,
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Color(AppColors.themecolor),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: (() {
              if (_userController.getEkipman()!.length > 0) {
                return Column(
                  children: [
                    GoruntuleButton(
                      textValue: "Ekipman Tanımlarını Görüntüle",
                      method: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Flexible(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              thickness: 5,
                              controller: _scrollController,
                              radius: Radius.circular(15),
                              child: ListView.builder(
                                controller: _scrollController,
                                itemBuilder: (BuildContext context, index) {
                                  return EkipmanCard(
                                    ekipmanIstek:
                                        _userController.getEkipman()![index],
                                  );
                                },
                                itemCount: _userController.getEkipman()!.length,
                              ),
                            )),
                      ),
                    ),
                  ],
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(AppColors.secondarycolor),
                      border: Border.all(
                          color: Color(AppColors.blacktextcolor), width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Herhangi bir ekipman tanımı bulunmuyor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(AppColors.whitetextcolor)),
                  ),
                );
              }
            }())),
      ),
    );
  }
}
