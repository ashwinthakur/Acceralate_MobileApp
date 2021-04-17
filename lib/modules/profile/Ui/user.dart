import 'dart:convert';
import 'package:new_video/modules/profile/Bloc/models/userdata.dart';
import 'package:flutter/material.dart';
import 'package:new_video/modules/profile/Bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_video/modules/profile/Ui/useredit.dart';
import 'package:new_video/overrides.dart' as overrides;
import 'package:new_video/globals.dart' as globals;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_video/utiles/utility.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;
  bool pushEnabled = true;
  UserBloc _bloc = UserBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserData obj1;
  void initState() {
    super.initState();
    _bloc.add(UserButtonPressed());
  }

  login() async {
    _bloc.add(UserButtonPressed());
  }

  final backColor = const Color(0xFF1D252F);
  final sebarcolor = const Color(0xFF8E8E93);
  Color c = const Color.fromRGBO(142, 142, 147, 0.12);

  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFFA6F48),
            elevation: 0,
            titleSpacing: 0.0,
            title: Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: 0.0, top: 0.0, left: 15, bottom: 0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ]),
            ]),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UsereditPage()),
                      );
                    },
                    child: Icon(
                      Icons.edit_rounded,
                      color: Colors.white,
                      size: 26.0,
                    ),
                  )),
            ]),
      ),
      body: ListView(
        children: [
          BlocBuilder(
              bloc: _bloc,
              builder: (BuildContext context, UserState state) {
                if (state is UserSuccess) {
                  return state.obj != null
                      ? makeWidget()
                      : Center(
                          child: Text("No Data found"),
                        );
                } else if (state is Loading) {
                  return Center();
                } else {
                  return Container();
                }
              }),
          BlocListener<UserBloc, UserState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is UserSuccess) {
                Utility.showSnackBar(
                    _scaffoldKey, "Successfully GetUserData", context);
              }

              if (state is ErrorReceived1) {
                if (state.err != null && state.err != "") {
                  Utility.showSnackBar(_scaffoldKey, "${state.err}", context);
                }
              }
            },
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget makeWidget() {
    return Container(
      margin: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ClipPath(
            child: Container(
              width: Utility.displayWidth(context) * 100,
              color: Color(0xFFFA6F48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  obj1 != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: CachedNetworkImageProvider(
                            obj1.avatar,
                          ),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red.withOpacity(0),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                'https://picsum.photos/250?image=9'),
                          ),
                        ),
                  SizedBox(
                    width: 200.0,
                    height: 70.0,
                    child: Container(
                      padding: EdgeInsets.only(left: 60, right: 0, top: 10),
                      child: Text(
                        obj1 != null
                            ? obj1.displayname != null &&
                                    obj1.displayname.isNotEmpty
                                ? obj1.displayname
                                : ""
                            : "",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: "SF Pro Display",
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            clipper: BottomWaveClipper(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
            child: Container(
              padding: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
              child: ListTile(
                title: Text(
                  "Phone number",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "SF UI Display",
                      fontSize: 17),
                ),
                trailing: Text(
                  "(210)4241968",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "SF UI Display",
                      fontSize: 17),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
            child: Container(
              padding: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
              child: ListTile(
                title: Text(
                  "Email Address ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "SF UI Display",
                      fontSize: 17),
                ),
                trailing: Text(
                  obj1 != null
                      ? obj1.email != null
                          ? obj1.email
                          : " "
                      : " ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "SF UI Display",
                      fontSize: 17),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
            child: ListTile(
              title: Text(
                "Change Password",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: "SF UI Display",
                    fontSize: 17),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF536274),
                size: 15,
              ),
              selected: true,
              onTap: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
            child: ListTile(
              title: Text(
                "Push Notification",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: "SF UI Display",
                    fontSize: 17),
              ),
              trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Transform.scale(
                        scale: 1.2,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.white,
                          activeTrackColor: Colors.greenAccent,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.white54,
                        )),
                  ]),
              selected: true,
              onTap: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
            child: ListTile(
              title: Text(
                "Manage Subscription",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: "SF UI Display",
                    fontSize: 17),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF536274),
                size: 15,
              ),
              selected: true,
              onTap: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, top: 5, right: 10, bottom: 5),
            child: ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: "SF UI Display",
                    fontSize: 17),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF536274),
                size: 15,
              ),
              selected: true,
              onTap: () {},
            ),
          ),
        ]),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 3, size.height);
    var firstEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.75), size.height + 120);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0.0);
    path.close();

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
