// ignore_for_file: prefer_const_constructors

import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_news/controller/new_conttroller.dart';
import 'package:hello_news/view/bottom_nav_bar/business.dart';
import 'package:hello_news/view/bottom_nav_bar/health.dart';
import 'package:hello_news/view/bottom_nav_bar/science.dart';
import 'package:hello_news/view/bottom_nav_bar/sport.dart';

class HomePage extends GetWidget {
  // ignore: annotate_overrides
  NewsController controller = Get.put(NewsController());
  List<Widget> screens = [
    Health(),
    Business(),
    Sport(),
    Science(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 231, 144),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 199, 155, 228),
        title: Text(
          'News App',
          //google fonts
          style: GoogleFonts.kaushanScript(
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: GetX<NewsController>(
          builder: (controller) => CircleBottomNavigationBar(
                circleColor: Color.fromARGB(255, 233, 155, 247),
                activeIconColor: Colors.black,
                inactiveIconColor: Color.fromARGB(255, 255, 193, 5),
                initialSelection: controller.currentInd.value,
                onTabChangedListener: ((val) {
                  controller.currentInd.value = val;
                }),
                tabs: [
                  TabData(
                    icon: Icons.health_and_safety,
                    title: 'Health',
                    fontSize: 17,
                    iconSize: 25,
                  ),
                  TabData(
                    icon: Icons.business,
                    title: 'Business',
                    fontSize: 17,
                    iconSize: 25,
                  ),
                  TabData(
                    icon: Icons.sports,
                    title: 'Sports',
                    fontSize: 17,
                    iconSize: 25,
                  ),
                  TabData(
                    icon: Icons.science,
                    title: 'Science',
                    fontSize: 17,
                    iconSize: 25,
                  ),
                ],
              )),
      body: GetX<NewsController>(
          builder: (controller) => screens[controller.currentInd.value]),
    );
  }
}
