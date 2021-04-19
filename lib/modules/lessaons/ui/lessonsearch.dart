import 'package:flutter/material.dart';
import 'dart:async';

class LessonSearchPage extends StatefulWidget {
  @override
  _LessonSearchPageState createState() => _LessonSearchPageState();
}

class _LessonSearchPageState extends State<LessonSearchPage> {
  List<String> newDataList = List.from(mainDataList);
  final backColor = const Color(0xFF1D252F);
  final sebarcolor = const Color(0xFF8E8E93);
  Color c = const Color.fromRGBO(142, 142, 147, 0.12);

  static List<String> mainDataList = [
    "Striking 101",
    "How To fall Correctly",
    "Protect Your Face",
  ];

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

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
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 5, right: 20, bottom: 5),
              child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: c,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: const BorderSide(),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: onItemChanged,
                ),
              ),
            ),
            Container(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(12.0),
                children: newDataList.map((data) {
                  return ListTile(
                    title: Text(data),
                    onTap: () => print(data),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 18, top: 10, right: 00, bottom: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: const EdgeInsets.all(0.0),
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 00, bottom: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Recent Searches",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        color: Colors.white54,
                        fontSize: 18),
                  ),
                ),
              ]),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 0.0, color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
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
                      fontFamily: 'SF UI Display Bold',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 17),
                ),
                trailing: Text(
                  "5:00",
                  style: TextStyle(
                      fontFamily: 'SF UI Display Bold',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 17),
                ),
                selected: true,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LessonSearchPage()));
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 0.0, color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
                        ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "How To Fall Correctly",
                  style: TextStyle(
                      fontFamily: 'SF UI Display Bold',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 17),
                ),
                trailing: Text(
                  "3.50",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 0.0, color: Colors.white54),
                    borderRadius: BorderRadius.all(Radius.circular(
                            20.0) //                 <--- border radius here
                        ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Protect Your Face",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20),
                ),
                trailing: Text(
                  "2.50",
                  style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18),
                ),
                selected: true,
                onTap: () {},
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15, top: 0, right: 00, bottom: 2.5),
            ),
          ]),
        ),
      ),
    );
  }
}
