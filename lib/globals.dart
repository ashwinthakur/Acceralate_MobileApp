// import 'package:ACCELERATE/src/widgets/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

// import 'modules/login/ui/login-page.dart';

var context;
var username;
var password;
var editData;
String registractionToken = "Not Defined (Error in code)";
String token = "Not Defined (Error in code)";
String title = "Not Defined (Error in code)";
String content = "Not Defined (Error in code)";
String experts = "Not Defined (Error in code)";
String token_name = "Not Defined (Error in code)";
String pushNotification = "Not Defined (Error in code)";
var userObj;
var patient; // TO store patient and provider info both
var client; // To sotre client info
var userData;
var courseData;
int courseId = 100;
var planData; // for chat lobby
bool alreaySetState = false;
