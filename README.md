# Pave AI Assignment

Here is a demo video:

[![Demo Video](https://img.youtube.com/vi/vo8sRVreino/0.jpg)](https://www.youtube.com/watch?v=vo8sRVreino)

## Description

This Flutter application demonstrates various UI features including animated text, image-text cards, and a timeline view. It leverages the `animated_text_kit` package for animations and `timeline_tile` package for a visually appealing timeline.

## Features

- Animated header with a typewriter effect.
- Responsive image-text cards with descriptions.
- Interactive timeline with custom indicators.

## Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.x or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE with Flutter support (e.g., Android Studio, Visual Studio Code)
- An emulator or physical device for testing



```sh
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
```
Import Statements

flutter/material.dart: Provides Flutter's material design components.

timeline_tile/timeline_tile.dart: Used for creating timeline widgets.

animated_text_kit/animated_text_kit.dart: Used for animated text widgets.


Main Function

```sh
void main() {
  runApp(MyApp());
}
```
main(): The entry point of the Flutter application.
runApp(MyApp()): Runs the MyApp widget, which becomes the root of the widget tree.
MyApp Widget

```sh
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
```
MyApp: A stateless widget that represents the whole application.

MaterialApp: A convenience widget that wraps several widgets that are commonly required for material design applications.

debugShowCheckedModeBanner: Removes the debug banner.

title: The title of the application.

theme: Defines the application's theme.

home: The default route of the app, here it is MyHomePage.

MyHomePage Widget

```sh
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
                      color: Color.fromRGBO(38, 40, 57, 1),
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
                color: Color.fromRGBO(38, 40, 57, 1),
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
                              color: Color.fromRGBO(38, 40, 57, 1),
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
}
```

MyHomePage: A stateless widget that represents the home screen.

Scaffold: Implements the basic material design visual layout structure.

backgroundColor: Sets the background color of the scaffold.

SingleChildScrollView: A scroll view that scrolls in a single direction.

padding: Sets the padding for the scroll view.

Column: A widget that displays its children in a vertical array.

crossAxisAlignment: Aligns children horizontally.

Center: Centers its child within itself.

AnimatedTextKit: A package for animated text widgets.

TypewriterAnimatedText: Creates a typewriter animation effect.

TextStyle: Defines the text style.

SizedBox: Adds space between widgets.

Row: A widget that displays its children in a horizontal array.

mainAxisAlignment: Aligns children vertically.

_buildImageTextCard: A custom function that returns a widget.

Custom Widget: ImageTextCard

```sh
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
                    color: Color.fromRGBO(38, 40, 57, 1),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'TroyeSerif',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromRGBO(38, 40, 57, 1),
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
```
_buildImageTextCard: A custom function that returns a styled widget displaying an image, title, and description.

Expanded: Expands the widget to fill the available space.

Container: A convenience widget that combines common painting, positioning, and sizing widgets.

margin: Adds space around the container.

BoxDecoration: Adds decoration to the container, like color, border radius, and box shadow.

ClipRRect: Clips its child using a rounded rectangle.

Image.asset: Loads an image from the asset bundle.

Padding: Adds padding to its child.

Custom Widget: TimelineTile

```sh
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
                  color: Color.fromRGBO(38, 40, 57, 1),
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
                  color: Color.fromRGBO(38, 40, 57, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
```

_buildTimelineTile: A custom function that returns a TimelineTile widget.

TimelineTile: A widget from the timeline_tile package that displays a timeline.

isFirst: Boolean to indicate if it is the first tile in the timeline.

isLast: Boolean to indicate if it is the last tile in the timeline.

IndicatorStyle: Customizes the appearance of the timeline indicator.

endChild: The widget displayed at the end of the timeline tile.

Padding: Adds padding to the endChild.

IntrinsicHeight: Makes its child have the same height as the largest child.

Column: Displays its children in a vertical array.

crossAxisAlignment: Aligns children horizontally.

Flexible: Expands the child to fill the available space.

Text: Displays the text.




## Setup and Installation

1. **Clone the Repository**

    ```sh
    git clone https://github.com/RishiMaddi1/Pave_ai_assignment.git
    ```

2. **Navigate to the Project Directory**

    ```sh
    cd Pave_ai_assignment
    ```

3. **Install Dependencies**

    ```sh
    flutter pub get
    ```

4. **Run the Application**

    ```sh
    flutter run
    ```

## Folder Structure

- `lib/`: Contains the main application code.
- `main.dart`: Entry point of the application, includes the main UI and logic.

Contains image files used in the app. Ensure that paths to these images in `main.dart` are correctly set.

## Configuration

Update image paths in `main.dart` according to the images available in the `assets/` directory.

## Contributing

To contribute to this project:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes.
4. Push to your branch.
5. Open a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments

- `TimelineTile` - Used for creating timeline views.
- `Animated Text Kit` - Used for animated text effects.

## Contact

For questions or inquiries, contact:

- Email: [maddi.rishi2468@gmail.com](mailto:maddi.rishi2468@gmail.com)
