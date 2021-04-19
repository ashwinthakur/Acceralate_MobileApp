import 'package:flutter/material.dart';
import 'package:new_video/modules/lessaons/ui/course.dart';
import 'package:new_video/modules/lessaons/ui/lessonsearch.dart';
import 'package:new_video/modules/profile/Ui/user.dart';
import 'home.dart';

class ButtomNavigationPage extends StatefulWidget {
  @override
  _ButtomNavigationPageState createState() => _ButtomNavigationPageState();
}

class _ButtomNavigationPageState extends State<ButtomNavigationPage> {
  int _selectedIndex = 0;
  final backColor = const Color(0xFF1D252F);
  static const _kFontFam = 'ACCELERATECustomIcons';
  static const _kFontPkg = null;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget showIndicator(bool show) {
    return show
        ? Icon(Icons.brightness_1, size: 10, color: Color(0xffFA6F48))
        : SizedBox(
            height: 10,
          );
  }

  selectScreenBody(context, _selectedIndex) {
    if (_selectedIndex == 0) {
      return HomePage();
    } else if (_selectedIndex == 1) {
      return CoursePage();
    } else if (_selectedIndex == 2) {
      return LessonSearchPage();
    } else if (_selectedIndex == 3) {
      return UserPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: selectScreenBody(context, _selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 0.0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            backgroundColor: Color(0xff1D252F),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    showIndicator(_selectedIndex == 0),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                      child: Icon(
                        const IconData(0xe809,
                            fontFamily: _kFontFam, fontPackage: _kFontPkg),
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    showIndicator(_selectedIndex == 1),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Icon(
                        const IconData(0xe815,
                            fontFamily: _kFontFam, fontPackage: _kFontPkg),
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(children: [
                  showIndicator(_selectedIndex == 2),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Icon(
                      const IconData(0xe812,
                          fontFamily: _kFontFam, fontPackage: _kFontPkg),
                      size: 40.0,
                    ),
                  ),
                ]),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    showIndicator(_selectedIndex == 3),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red.withOpacity(0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage('https://picsum.photos/250?image=9'),
                        ),
                      ),
                    ),
                  ],
                ),
                label: '',
              ),
            ],
            elevation: 10.0,
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            selectedItemColor: Colors.red,
            onTap: _onItemTap,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 105,
                blurRadius: 10.0,
                offset: Offset(0, -6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
