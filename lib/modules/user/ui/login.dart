import 'package:flutter/material.dart';
import 'package:new_video/modules/home/Ui/buttomNavigation.dart';
import 'package:new_video/utiles/utility.dart';
import 'register.dart';
import 'package:new_video/modules/user/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_video/modules/user/ui/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _bloc = LoginBloc();
  bool _isHidden = true;

  login() async {
    _bloc.add(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: const EdgeInsets.all(0.0),
        color: Color(0XFF191720),
        child: ListView(children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                disabledColor: Colors.grey,
                highlightColor: Colors.black38,
              )),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 30, right: 00, bottom: 2.5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding:
                        EdgeInsets.only(left: 0, top: 0, right: 00, bottom: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0XFF191720),
                    ),
                    child: Text(
                      "Let's sign you in.",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "SF UI Display",
                          color: Colors.white,
                          fontSize: 36),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15, top: 2.5, right: 00, bottom: 2.5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding: EdgeInsets.only(
                        left: 0, right: 55, top: 2.5, bottom: 0.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0XFF191720),
                    ),
                    child: Text(
                      "Welcome back.",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "SF UI Display",
                          color: Colors.white,
                          fontSize: 28),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 15, top: 0.5, right: 20, bottom: 2.5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    padding: EdgeInsets.only(
                        left: 0, right: 15, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0XFF191720),
                    ),
                    child: Text(
                      "You've been missed!",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "SF UI Display",
                          color: Colors.white,
                          fontSize: 28),
                    ),
                  ),
                ]),
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 5, top: 15, right: 10, bottom: 2.5),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: 15, right: 20, bottom: 2.5),
                    child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.white,
                        primaryColorDark: Colors.white,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0XFF1e1c24).withOpacity(0.1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          hintText: 'Phone Email or Username',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF UI Display",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, top: 15, right: 20, bottom: 15),
                    child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.white,
                        primaryColorDark: Colors.white,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0XFF1e1c24).withOpacity(0.1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF UI Display",
                          ),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                      print("Navigate to Registration Page");
                    },
                    child: Container(
                        margin: const EdgeInsets.all(0.0),
                        padding: EdgeInsets.only(
                            left: 5, right: 15, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0XFF191720),
                        ),
                        child: Text(
                          "Don't have an account ? Register ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: "SF UI Display",
                              color: Colors.white,
                              fontSize: 18),
                        )),
                  ),
                  BlocBuilder(
                      bloc: _bloc,
                      builder: (BuildContext context, LoginState state) {
                        print("***Inside the BlocBuilder ***");
                        print(state);
                        return Container(
                          padding: EdgeInsets.only(
                              left: 10, top: 40, right: 10, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state is Loading
                                        ? Padding(
                                            padding: EdgeInsets.only(right: 7),
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                      new AlwaysStoppedAnimation<
                                                              Color>(
                                                          Color(0xff000000))),
                                            ),
                                          )
                                        : Container(),
                                    Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "SF UI Display",
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  print('Login Button Pressed');
                                  login();
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  padding:
                                      EdgeInsets.only(top: 20.0, bottom: 20.0),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              )),
          BlocListener<LoginBloc, LoginState>(
            bloc: _bloc,
            listener: (context, state) {
              if (state is LoginSuccess) {
                Utility.showSnackBar(
                    _scaffoldKey, "Successfully loggedin", context);

                new Future.delayed(new Duration(seconds: 0), () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ButtomNavigationPage()));
                });
              }

              if (state is ErrorinLogin) {
                if (state.err != null && state.err != "") {
                  Utility.showSnackBar(_scaffoldKey, "${state.err}", context);
                }
              }
            },
            child: Container(),
          ),
        ]),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
