import 'package:flutter/material.dart';
import 'package:parallax_slider/parallax_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ParallaxSlider(
            imageType: ParallaxSliderImageType.NETWORK,
            imagePaths: [
              "https://img.freepik.com/free-photo/beautiful-mountains-landscape_23-2150787826.jpg",
              "https://img.freepik.com/free-photo/high-angle-shot-brown-rock-formation-lot-parked-cars-blue-sky-evening_181624-4980.jpg",
              "https://img.freepik.com/free-photo/landscape-morning-fog-mountains-sunrise_335224-793.jpg",
              "https://img.freepik.com/free-photo/beautiful-mountains-landscape_23-2150787970.jpg"
            ],
            height: 100,
            spaceBetweenItems: 20,
          ),
        ],
      ),
    );
  }
}
