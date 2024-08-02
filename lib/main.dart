import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 241, 222, 1), 
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Features',
                    textStyle: TextStyle(
                      fontFamily: 'TroyeSerif',
                      fontSize: 140,
                      color: Color.fromRGBO(38,40,57,1),
                    ),
                    speed: Duration(milliseconds: 100),
                    cursor: '_',
                  ),
                ],
                repeatForever: true,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageTextCard('images/pic1.jpg', 'Feature 1', 'Description of feature 1. Lorem ipsum'),
                _buildImageTextCard('images/pic4.png', 'Feature 2', 'Description of feature 2. Lorem ipsum'),
                _buildImageTextCard('images/pic3.jpg', 'Feature 3', 'Description of feature 3. Lorem ipsum'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'How it works?',
              style: TextStyle(
                fontFamily: 'TroyeScript',
                fontSize: 130,
                color: Color.fromRGBO(38,40,57,1),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Company A transforms your processes into easy workflows. Here\'s how it works :',
                            textStyle: TextStyle(
                              fontFamily: 'TroyeScript',
                              fontSize: 50,
                              color: Color.fromRGBO(38,40,57,1),
                            ),
                          ),
                        ],
                        repeatForever: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildTimelineTile('1', 'Input Your Vision', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', true, false),
                        _buildTimelineTile('2', 'Get Your Workflow', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false, false),
                        _buildTimelineTile('3', 'Customize Your Workflow', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', false, true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 85),
          ],
        ),
      ),
    );
  }

  Widget _buildImageTextCard(String imagePath, String title, String description) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'TroyeScript',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color.fromRGBO(38,40,57,1),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'TroyeSerif',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromRGBO(38,40,57,1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineTile(String indicatorText, String title, String description, bool isFirst, bool isLast) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 70,
        height: 50,
        color: Colors.green,
        indicator: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              indicatorText,
              style: TextStyle(
                fontFamily: 'TroyeScript',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      endChild: Padding(
        padding: EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'TroyeScript',
                    fontSize: 60,
                    color: Color.fromRGBO(38,40,57,1),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Flexible(
                child: Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'TroyeScript',
                    fontSize: 35,
                    color: Color.fromRGBO(38,40,57,1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
