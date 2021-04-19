import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString =
      "https://www.udemy.com/course/the-complete-guide-to-angular-2/learn/lecture/13914134?components=buy_button%2Cdiscount_expiration%2Cgift_this_course%2Cpurchase%2Cdeal_badge%2Credeem_coupon#overview";

  String username = "hr.indore@zehntech.com";
  String password = "Zehntech@training";
  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFA6F48),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => print("BACK PERVIOUS PAGE"),
            // Navigator.pop(context),
          )
        ],
      ),
      url: urlString,
      withZoom: false,
    );
  }
}
