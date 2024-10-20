import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MAVERICK",
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF494B53), Color(0xFF000000)],
            stops: [0, 5], // Optional: Define the distribution of colors
            center: Alignment(0.0, 0.0), // Center of the gradient
            radius: 1.5, // Radius of the gradient
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Stack(
                children: [
                  Positioned(
                    child: SingleChildScrollView(
                        child: Stack(
                      children: [
                        Positioned(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height + 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.asset(
                                        'assets/MAVERICK - Main.png',
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height + 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 650,
                                          maxHeight: MediaQuery.of(context)
                                              .size
                                              .height),
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white, BlendMode.srcOver),
                                        child: Image.asset(
                                          'assets/FlutterTest.png',
                                          fit: BoxFit.contain,
                                          color: Colors.black,
                                          colorBlendMode: BlendMode.softLight,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text("Test"),
                              Text("LOREM BLAMBALDEFE"),
                              Container(
                                color: Colors.yellow[50],
                                width: MediaQuery.of(context).size.width,
                                height: 1000,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      color: Colors.green,
                      width: 50,
                      height: 150,
                    ),
                  )
                ],
              ),
            ),
            // Positioned(
            //   top: 0,
            //   child: Container(
            //     color: Colors.red[100],
            //     width: MediaQuery.of(context).size.width,
            //     height: 50,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [Text("LOGO"), Text("PAGE")],
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     color: Colors.red[100],
            //     width: MediaQuery.of(context).size.width,
            //     height: 50,
            //   ),
            // )
          ],
        ),
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}
