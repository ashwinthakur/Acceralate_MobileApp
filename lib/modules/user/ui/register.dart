import 'package:new_video/modules/user/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_video/utiles/utility.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidden = true;
  LoginBloc _bloc = LoginBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();

  register() async {
    _bloc.add(Registration(
      username: _usernameController.text,
      password: _passwordController.text,
      email: _emailController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: const EdgeInsets.all(0.0),
        color: Color(0XFF191720),
        child: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 15, top: 40, right: 00, bottom: 2.5),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(0.0),
                      padding: EdgeInsets.only(
                          left: 10, top: 0, right: 00, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0XFF191720),
                      ),
                      child: Text(
                        "Registration Page",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: "SF UI Display",
                            fontSize: 36),
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
                            fillColor: Colors.black12.withOpacity(0.5),
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
                            hintText: 'Username ',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12.withOpacity(0.5),
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
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white,
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
                            fillColor: Colors.black12.withOpacity(0.5),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: "SF UI Display",
                              color: Colors.white,
                              //  fontStyle: FontStyle.italic,
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
                    BlocBuilder(
                        bloc: _bloc,
                        builder: (BuildContext context, LoginState state) {
                          print("Inside the BlocBuider Bloc  state ------");
                          print(state);
                          return Container(
                            padding: EdgeInsets.only(
                                left: 10, top: 40, right: 10, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state is Loading
                                          ? Padding(
                                              padding:
                                                  EdgeInsets.only(right: 7),
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
                                        'Register',
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
                                    print('Register Button Pressed');
                                    register();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    padding: EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
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
                if (state is Registered) {
                  Utility.showSnackBar(
                      _scaffoldKey, "Successfully Registered", context);

                  new Future.delayed(new Duration(seconds: 1), () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  });
                }

                if (state is ErrorinRegistration) {
                  if (state.err != null && state.err != "") {
                    Utility.showSnackBar(_scaffoldKey, "${state.err}", context);
                  }
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
