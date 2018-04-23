import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Gallery",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: DisplayPage(),
    );
  }
}

class DisplayPage extends StatefulWidget {
  @override
  DisplayPageState createState() => DisplayPageState();
}

class DisplayPageState extends State<DisplayPage> {
  final List<String> images = [
    "assets/photo-1.jpg",
    "assets/photo-2.jpg",
    "assets/photo-3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: SizedBox.fromSize(
          size: Size.fromHeight(500.0),
          child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.bottomRight,
                                  end: FractionalOffset.topLeft,
                                  colors: [
                                    Color(0x1c6d6c).withOpacity(0.9),
                                    Color(0x821763).withOpacity(0.01)
                                  ]
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                );
              }),
        ),
      ),
    );
  }
}
