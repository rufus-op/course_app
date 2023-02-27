import 'package:course_app/Screens/screen2.dart';
import 'package:course_app/components/homePageBody.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
List Screen = const [ HomePageBody(),b(),b(),b()];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          //Body
          body: Screen[_index],
          // Bottom Navigation Bar
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFffFBE30),
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            fixedColor:  Color(0xFffFBE30),
            selectedLabelStyle: const TextStyle(color: Colors.deepPurple),
            selectedFontSize: 11,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color:  Color(0xFffFBE30),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_outlined,
                    color:  Color(0xFffFBE30),
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color:  Color(0xFffFBE30),
                  ),
                  label: 'My Courses'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outline,
                    color:  Color(0xFffFBE30),
                  ),
                  label: 'WishList'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                    color:  Color(0xFffFBE30),
                  ),
                  label: 'Profile'),
            ],
          ),
        

    );
  }
}

