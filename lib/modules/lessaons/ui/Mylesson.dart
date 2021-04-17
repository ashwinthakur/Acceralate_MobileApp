import 'package:flutter/material.dart';
import 'package:new_video/widgets/myvideoPlayer.dart';
import 'dart:async';
import 'package:new_video/widgets/myvideoPlayer.dart';

// ignore: must_be_immutable

class MyLessonPage extends StatefulWidget {
  @override
  _MyLessonPageState createState() => _MyLessonPageState();
}

class _MyLessonPageState extends State<MyLessonPage> {
  int _act = 0;

  double _progressValue = 0.0;
  bool _loading;
  bool isPressed = false;
  Color backColor = Color(0xFF1D252F);
  Color headColor = Color(0xFFFFFFFF);

  Color pausebuttonColor = Color(0xFFFA6F48);
  Color playbuttoncolor = Color(0XFF9DB0C7);
  final titlecolor = const Color(0xFF536274);
  int _selectedIndex = 0;

  Widget showIndicator(bool show) {
    return show
        ? Icon(Icons.pause, size: 25, color: Color(0xffFA6F48))
        : Icon(Icons.play_arrow, size: 25, color: Color(0xffFA6F48));
  }

  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  String url =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backColor,
        elevation: 0,
        titleSpacing: 0.0,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(right: 0.0, top: 0.0, left: 15, bottom: 0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ]),
        actions: <Widget>[
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

        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 0, right: 00, bottom: 2.5),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding:
                        EdgeInsets.only(left: 0, top: 0, right: 00, bottom: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "My Modules",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: headColor,
                          fontFamily: "SF Pro Display",
                          fontSize: 38),
                    ),
                  ),
                ]),
              ),
              Container(
                child: MyVideoPlayer(
                  videoUrl: url,
                  key: Key(url),
                ),
              ),

              /////list1/////////////////////////////

              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 10, bottom: 5, top: 5),
                child: ListTile(
                  leading: _act != 1
                      ? Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: playbuttoncolor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: pausebuttonColor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                  title: Text(
                    "Striking 101",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold"',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 17),
                  ),
                  trailing: Text(
                    "5:00",
                    style: TextStyle(
                        fontFamily: "SF UI Display",
                        fontWeight: FontWeight.w500,
                        color: titlecolor,
                        fontSize: 14),
                  ),
                  selected: true,
                  onTap: () {
                    print("listile 1    1      1");

                    setState(() {
                      url =
                          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4';
                      _act = 1;
                    });
                  },
                ),
              ),

              /////////////list 2////////////////////
              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 10, bottom: 5, top: 5),
                child: ListTile(
                  leading: _act != 2
                      ? Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: playbuttoncolor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: pausebuttonColor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                  title: Text(
                    "How To Fall Correctly",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 17),
                  ),
                  trailing: Text(
                    "3:50",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 14),
                  ),
                  selected: true,
                  onTap: () {
                    setState(() {
                      url =
                          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

                      _act = 2;
                    });
                  },
                ),
              ),

              ////////////////////list3 ////////////
              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 10, bottom: 5, top: 5),
                child: ListTile(
                  leading: _act != 3
                      ? Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: playbuttoncolor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: pausebuttonColor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                  title: Text(
                    "Defense Against Knife",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 17),
                  ),
                  trailing: Text(
                    "2:50",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 14),
                  ),
                  selected: true,
                  onTap: () {
                    setState(() {
                      url =
                          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4';

                      _act = 3;
                    });
                  },
                ),
              ),

              ////////////////////////list4//////////////

              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 10, bottom: 5, top: 5),
                child: ListTile(
                  leading: _act != 4
                      ? Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: playbuttoncolor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: pausebuttonColor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                  title: Text(
                    "Protect Your Face",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold"',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 17),
                  ),
                  trailing: Text(
                    "5:00",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 14),
                  ),
                  selected: true,
                  onTap: () {
                    setState(() {
                      url =
                          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4';

                      _act = 4;
                    });
                  },
                ),
              ),

              //////////////////////////////list5/////////////
              Container(
                padding: const EdgeInsets.only(
                    left: 5, right: 10, bottom: 5, top: 5),

                //color: Colors.blueGrey[900],
                child: ListTile(
                  leading: _act != 5
                      ? Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: playbuttoncolor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: pausebuttonColor,
                            border:
                                Border.all(width: 0.0, color: Colors.white54),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    14.0) //                 <--- border radius here
                                ),
                          ),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                  title: Text(
                    "Use Your Hips",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 17),
                  ),
                  trailing: Text(
                    "3:50",
                    style: TextStyle(
                        fontFamily: 'SF UI Display Bold',
                        fontWeight: FontWeight.w600,
                        color: titlecolor,
                        fontSize: 14),
                  ),
                  selected: true,
                  onTap: () {
                    setState(() {
                      url =
                          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4';

                      _act = 5;
                    });
                  },
                ),
              ),
            ], //<Widget>[]
          ), //Stack
        ), //Center
      ), //SizedBox
    );
  }
}
