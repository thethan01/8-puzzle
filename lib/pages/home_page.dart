import 'package:eight_puzzle/core/manipulators/shuffler.dart';
import 'package:eight_puzzle/core/manipulators/solver.dart';
import 'package:eight_puzzle/utils/styles/color_utils.dart';
import 'package:eight_puzzle/utils/widgets/github.dart';
import 'package:eight_puzzle/utils/widgets/n_puzzle/n_puzzle.dart';
import 'package:eight_puzzle/utils/widgets/puzzle_image_selector.dart';
import 'package:eight_puzzle/utils/widgets/puzzle_size_option_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedImageIndex = 1;
  int selectedOptionIndex = 1;

  List<String> images = [
    "man",
    "woman",
    "music",
    "girl",
  ];

  GlobalKey<ScaffoldState> s = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmall = constraints.maxWidth < 850;
        return Scaffold(
          key: s,
          backgroundColor: Colors.white,
          drawer: Offstage(
            offstage: !isSmall,
            child: Drawer(
              child: Container(
                color: Colors.black,
                child: Container(
                  color: baseColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 20,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(isSmall ? 20 : 40),
              child: Row(
                children: [
                  Offstage(
                    offstage: isSmall,
                    child: Container(
                      width: 290,
                      margin: EdgeInsets.only(right: 20),
                      height: double.maxFinite,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [

                        Expanded(
                          child: NPuzzle(
                            image: images[selectedImageIndex],
                            dimensions: selectedOptionIndex + 2,
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
