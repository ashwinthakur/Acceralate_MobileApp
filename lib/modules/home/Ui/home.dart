import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_video/modules/lessaons/ui/course.dart';
import 'package:new_video/utiles/utility.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:new_video/modules/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final backColor = const Color(0xFF1D252F);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var unescape = HtmlUnescape();

  HomeBloc _bloc = HomeBloc();
  void initState() {
    super.initState();
    _bloc.add(HomePageEvent());
  }

  home() async {
    _bloc.add(HomePageEvent());
  }

  Widget _trainingData(obj) => Container(
        width: Utility.displayWidth(context) * 0.60,
        margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Color(0xFFC6E5FC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              print("Container was tapped");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CoursePage()));
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding: EdgeInsets.only(
                        left: 20, top: 40, right: 10, bottom: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Beginner",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "SF UI Display Medium",
                          color: Color(0XFF77838F),
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding:
                        EdgeInsets.only(left: 20, top: 5, right: 10, bottom: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      unescape.convert("${obj.title}"),
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF1E2022),
                          fontFamily: "SF UI Display Medium",
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding:
                        EdgeInsets.only(left: 20, top: 5, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Level of Diffculty.",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "SF UI Display Medium",
                          color: Color(0XFF77838F),
                          fontSize: 14),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(0.0),
                          padding: EdgeInsets.only(
                              left: 20, top: 5, right: 0, bottom: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/Fire_ico.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(0.0),
                          padding: EdgeInsets.only(
                              left: 5, top: 5, right: 0, bottom: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/Fire_ico.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(0.0),
                          padding: EdgeInsets.only(
                              left: 5, top: 5, right: 0, bottom: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/Fire_ico.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(0.0),
                          padding: EdgeInsets.only(
                              left: 5, top: 5, right: 0, bottom: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            "assets/images/Fire_ico.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding:
                        EdgeInsets.only(left: 20, top: 5, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "hello",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "SF UI Display Medium",
                          color: Color(0XFF77838F),
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );

  Widget _sliderWidget(obj) => Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: 324,
              aspectRatio: 16 / 9,
              autoPlay: false,
              viewportFraction: 0.6,
              disableCenter: false,
              enlargeCenterPage: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {}),
          items: obj.map<Widget>((i) {
            return Builder(
              builder: (BuildContext context) {
                return _trainingData(i);
              },
            );
          }).toList(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backColor,
        titleSpacing: 0.0,
        actions: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(right: 0.0, top: 0.0, left: 5, bottom: 0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 32.0,
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 0,
                bottom: 10,
              ),
              child: Text(
                "Beginner",
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: "SF UI Display",
                    color: Color(0XFFFA6F48),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 10, top: 0, right: 00, bottom: 2.5),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.all(0.0),
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 00, bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: "SF Pro Display",
                        fontSize: 38),
                  ),
                ),
              ]),
            ),
            BlocBuilder(
                bloc: _bloc,
                builder: (BuildContext context, HomeState state) {
                  if (state is FetchTrainingData) {
                    return state.obj != null && state.obj.length > 0
                        ? Container(
                            child: AnimatedOpacity(
                            opacity: 0.8,
                            duration: const Duration(milliseconds: 200),
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                alignment: Alignment.topCenter,
                                child: _sliderWidget(state.obj)),
                          ))
                        : Center(
                            child: Text("No Data found"),
                          );
                  } else if (state is Loading) {
                    return Container();
                  } else {
                    return Container();
                  }
                }),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide()),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.0, color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(
                            14) //                 <--- border radius here
                        ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Striking 101",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17),
                ),
                trailing: Text(
                  "5:00",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide()),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D252F),
                    border: Border.all(width: 0.0, color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(
                            14.00) //                 <--- border radius here

                        ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Striking 101",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17),
                ),
                trailing: Text(
                  "5:00",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide()),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D252F),
                    border: Border.all(width: 0.0, color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(
                            14) //                 <--- border radius here
                        ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Striking 101",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 17),
                ),
                trailing: Text(
                  "5:00",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 14),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
