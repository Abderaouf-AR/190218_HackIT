import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:next_game/Frontend/ProfilePage.dart';
import 'package:next_game/Frontend/recomPage.dart';
import 'dart:math';

import '../Backend/myEnums.dart';
import '../Utils/theme_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);



  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController!.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Container(child: Image.asset("assets/logo/ng.png"), width: 250,),
        centerTitle: true,
      ),
      body: (_selectedIndex == 0)?Column(
        children: [
          PlatformPart(),
          GamesPart(),
        ],
      ) : ProfilePage(),
      // floatingActionButton:FloatingActionButton(
      //   backgroundColor: backgroundColor,
      //   onPressed: (){
      //
      //   },
      //   child: Image.asset("assets/logo/logo_trans.png"),
      // ),
        floatingActionButton: GestureDetector(
          onTap: (){
            Get.to(RecomPage());
          },
          child: CircleAvatar(
            radius: 50,
             backgroundColor: Colors.blue.shade900,
             backgroundImage: AssetImage("assets/logo/logo_trans.png"),
             // child: Image.asset("assets/logo/logo_trans.png"),
             ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  TextStyle titleStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87
  );
  TextStyle subTitleStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black54
  );
  double myRadius = 30;
  Widget PlatformPart(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(3,3),
                blurRadius: 3,
                color: Colors.grey.shade300
            ),
            BoxShadow(
                offset: Offset(-5,-5),
                blurRadius: 3,
                color: Colors.grey.shade100
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Platform",
                style: titleStyle ,
              ),
              Text(
                "Choose your playing platform",
                style: subTitleStyle ,
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        nowPlatform = PlatformEnum.Android;
                      });
                    },
                    child: CircleAvatar(
                      radius: myRadius,
                      child: Image.asset("assets/images/Android.png", fit: BoxFit.cover,),
                      backgroundColor: (nowPlatform == PlatformEnum.Android ) ? Colors.blue.shade400 : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        nowPlatform = PlatformEnum.Windows;
                      });
                    },
                    child: CircleAvatar(
                      radius: myRadius,
                      child: Image.asset("assets/images/windows.png"),
                      backgroundColor: (nowPlatform == PlatformEnum.Windows ) ? Colors.blue.shade300 : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        nowPlatform = PlatformEnum.Xbox;
                      });
                    },
                    child: CircleAvatar(
                      radius: myRadius,
                      child: Image.asset("assets/images/Xbox-logo.png"),
                      backgroundColor: (nowPlatform == PlatformEnum.Xbox ) ? Colors.blue.shade300 : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        nowPlatform = PlatformEnum.Nentendo;
                      });
                    },
                    child: CircleAvatar(
                      radius: myRadius,
                      child: Image.asset("assets/images/nen.png"),
                      backgroundColor: (nowPlatform == PlatformEnum.Nentendo ) ? Colors.blue.shade300 : Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        nowPlatform = PlatformEnum.PS;
                      });
                    },
                    child: CircleAvatar(
                      radius: myRadius,
                      child: Image.asset("assets/images/ps.png"),
                      backgroundColor: (nowPlatform == PlatformEnum.PS ) ? Colors.blue.shade300 : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
            ],
          ),
        ),
      )
    );
  }

  PlatformEnum nowPlatform = PlatformEnum.Android;
  Widget PlatformChoice() {
    return DropdownButton<PlatformEnum>(
        value: nowPlatform,
        onChanged: (PlatformEnum? newValue) {
          setState(() {
            nowPlatform = newValue!;
          });
        },
        items: PlatformEnum.values.map((PlatformEnum classType) {
          return DropdownMenuItem<PlatformEnum>(
              value: classType,
              child: Text("${classType}"));
        }).toList()
    );
  }

  PageController? pageController;
  double viewportFraction = 0.8;
  double? pageOffset = 0;

  Widget GamesPart(){
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: MediaQuery.of(context).size.height/4+142,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(5,5),
                    blurRadius: 3,
                    color: Colors.grey.shade300
                ),
                BoxShadow(
                    offset: Offset(-5,-5),
                    blurRadius: 3,
                    color: Colors.grey.shade100
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Game List",
                      style: titleStyle ,
                    ),
                    Icon(Icons.gamepad_outlined)
                  ],
                ),
                GamesList()
              ],
            ),
          ),
        )
    );
  }
  Widget GamesList(){
    return Container(
      height: 300,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          double scale = max(viewportFraction, (1 - (pageOffset! - index).abs()) + viewportFraction);
          double angle = (pageOffset! - index).abs();
          if (angle > 0.5) {
            angle = 1 - angle;
          }
          if (index == 1) return Container(
            padding: EdgeInsets.only(right: 10, left: 20, top: 100 - scale * 25, bottom: 50),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: Image.asset('assets/images/r_v.jpg', fit: BoxFit.cover,),
            ),
          );
          if (index == 2) return Container(
            padding: EdgeInsets.only(right: 10, left: 20, top: 100 - scale * 25, bottom: 50),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: Image.asset('assets/images/fifa22.jpg', fit: BoxFit.cover,),
            ),
          );
          if (index == 0) return Container(
            padding: EdgeInsets.only(right: 10, left: 20, top: 100 - scale * 25, bottom: 50),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: Image.asset('assets/images/téléchargement.jpg', fit: BoxFit.cover,),
            ),
          );
          return Container(
            padding: EdgeInsets.only(right: 10, left: 20, top: 100 - scale * 25, bottom: 50),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              alignment: Alignment.center,
              child: Image.asset('assets/images/r_v.jpg', fit: BoxFit.cover,),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }

  Widget SubsPlansPart(){
    return Container();
  }

  Widget EnableDiscoverPart(){
    return Container();
  }
}
