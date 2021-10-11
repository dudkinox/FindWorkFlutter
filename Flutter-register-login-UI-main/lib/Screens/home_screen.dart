// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_ui/Recommendation_List_Data/Recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/Animation/Fade_Animation.dart';
import 'package:login_ui/Screens/homehome.dart';
import 'package:login_ui/Screens/profile/Profile.dart';
import 'package:login_ui/Screens/profile/ProfileController.dart';
import 'package:login_ui/Themes/Themes.dart';

import 'login/login.dart';

  DateTime backbuttonpressedTime;
class HomePage extends StatelessWidget {
  TextEditingController fullname = TextEditingController();
  String token = "";
  HomePage(this.newindex);
  int newindex;

  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context){
    print("ปัจจุบัน " + newindex.toString());
    return WillPopScope(
      onWillPop: onWillPop,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              FadeAnimation(
                1.0,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.rotate(
                          angle: 180 * pi / 180,
                          child: IconButton(
                            iconSize: 40,
                            color: PrimaryColor,
                            icon: const Icon(Icons.exit_to_app_rounded),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          )),
                      IconButton(icon: Icon(null), onPressed: () {}),
                      Row(
                        children: [
                          ClipOval(
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[900].withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://img.icons8.com/ios-glyphs/64/000000/user.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: FlatButton(
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfilePage()));
                                },
                                child: null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FutureBuilder(
                  future: FlutterSession().get('token'),
                  builder: (context, snapshot) {
                    print("token => " + snapshot.data.toString());
                    // DataProfile(snapshot.data.toString());
                    token = snapshot.data;
                    return FadeAnimation(
                      1.1,
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<TextEditingController>(
                                future: datafullname(snapshot.data.toString()),
                                builder: (context, snapshot) {
                                  fullname = snapshot.data;
                                  return Text(
                                    "สวัสดี, " + fullname.text,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                        fontSize: 20.0),
                                  );
                                }),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "คุณต้องการค้นหางานที่ไหน?!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: PrimaryColor,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 20.0,
              ),
              FadeAnimation(
                1.2,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                      cursorColor: PrimaryColor,
                      decoration: InputDecoration(
                        fillColor: PrimaryColor,
                        prefixIcon: Icon(
                          Icons.search,
                          color: PrimaryColor,
                        ),
                        hintText: "ค้นหาที่นี่",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: PrimaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: PrimaryColor),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              FadeAnimation(
                1.2,
                Container(
                  height: 610.0,
                  width: double.infinity,
                  color: PrimaryColor,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: TabBar(
                          labelColor: PrimaryColor,
                          indicatorColor: PrimaryColor,
                          unselectedLabelColor: PrimaryColor,
                          tabs: [
                            Tab(
                              icon: Icon(Icons.home_work_outlined),
                              text: "งานประจำ",
                            ),
                            Tab(
                              icon: Icon(Icons.home_work_rounded),
                              text: "พาร์ทไทม์",
                            ),
                            Tab(
                              icon: Icon(Icons.favorite_border),
                              text: "ชื่นชอบ",
                            ),
                          ]),
                      body: TabBarView(children: [
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "คำแนะนำ",
                                            style: TextStyle(
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "งานที่คุณอาจชอบ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "ดูทั้งหมด",
                                        style: TextStyle(
                                          color: PrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  SizedBox(height: 10.0,),
                                Container(
                                    height: 400.0,
                                    width: 400.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: RecommendationList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendationList[index];
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "คำแนะนำ",
                                            style: TextStyle(
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "งานที่คุณอาจชอบ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "ดูทั้งหมด",
                                        style: TextStyle(
                                          color: PrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  SizedBox(height: 10.0,),
                                Container(
                                    height: 400.0,
                                    width: 400.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: RecommendationList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendationList[index];
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "คำแนะนำ",
                                            style: TextStyle(
                                                color: PrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                          Text(
                                            "งานที่คุณอาจชอบ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "ดูทั้งหมด",
                                        style: TextStyle(
                                          color: PrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                    height: 400.0,
                                    width: 400.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: RecommendationList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendationList[index];
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget childCetegory() {
  return Container(
    height: 40.0,
    width: 120.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      boxShadow: [
        BoxShadow(
            color: Colors.deepOrangeAccent.withOpacity(.6),
            offset: Offset(0.0, 4.0)),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wine_bar,
          color: PrimaryColor,
        ),
        Text("Bar", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();

  bool backButton = backbuttonpressedTime == null ||
      currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

  if (backButton) {
    backbuttonpressedTime = currentTime;
    Fluttertoast.showToast(
        msg: "กดอีกครั้งเพื่อออก!!",
        backgroundColor: Colors.black,
        textColor: Colors.white);
    return false;
  }
  return true;
}