import 'dart:async';

import 'package:flutter/material.dart';

//popular courses will be displayed here! mostly design/animation/3d
class Slideshow extends StatefulWidget {
  const Slideshow({Key? key}) : super(key: key);

  @override
  State<Slideshow> createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      return setState(() {
        if (_currentPage < 4) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration:const  Duration(milliseconds: 250),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          itemCount: 5,
          controller: _pageController,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: const Card(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  child: Image(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-vector/multicolored-abstract-background_23-2148463672.jpg?w=2000',
                    ),
                    fit: BoxFit.cover,
                  )),
            );
          },
        ));
  }
}
