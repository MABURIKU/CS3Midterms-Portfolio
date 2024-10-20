import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HoverImage extends StatefulWidget {
  final String imagePath;

  const HoverImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() {
        _isHovered = false;
      }),
      child: ColorFiltered(
        colorFilter: _isHovered
            ? ColorFilter.mode(Colors.transparent, BlendMode.color)
            : ColorFilter.mode(Colors.grey, BlendMode.color),
        child: Image.asset(
          widget.imagePath,
          fit: BoxFit.contain,
          width: 300,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MAVERICK",
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xFF494B53), Color(0xFF000000)],
            stops: [0, 5],
            center: Alignment(0.0, 0.0),
            radius: 1.5,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Stack(
                children: [
                  Positioned(
                    child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 85, 15, 85),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height +
                                        100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image.asset(
                                            'assets/MAVERICK - LOGO Main.png',
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
                                    height:
                                        MediaQuery.of(context).size.height + 50,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(25, 0, 25, 0),
                                          constraints: BoxConstraints(
                                              maxWidth: 650,
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  50),
                                          child: Image.asset(
                                            'assets/MAVERICK - Portrait.png',
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 65),
                                    child: Column(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Color(0xFFDFDFDF),
                                                  fontSize: 40),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Hey there! I am ',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Wix Regular')),
                                                TextSpan(
                                                    text: 'Maverick',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Wix Bold')),
                                                TextSpan(
                                                    text: '.',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Wix Regular')),
                                              ]),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 650),
                                          child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Color(0xFFDFDFDF)
                                                        .withOpacity(0.6),
                                                    fontSize: 16),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          'A front-end engineer, UI/UX developer, and graphic designer. My style? Whatever works best for you. Whether it’s building a website, crafting a brand, or creating illustrations, I’m all about making your vision a reality.',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Wix Regular')),
                                                ]),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 120,
                                          child: TextButton(
                                            onPressed: () {
                                              _scrollController.animateTo(
                                                _scrollController.position
                                                        .maxScrollExtent -
                                                    100,
                                                duration:
                                                    Duration(milliseconds: 800),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                                  Color(0xFF353535),
                                              backgroundColor:
                                                  const Color(0xFFDFDFDF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                            child: const Text("Let's talk",
                                                style: TextStyle(
                                                    fontFamily: "Wix Regular",
                                                    fontSize: 16)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Color(0xFFDFDFDF),
                                                  fontSize: 40),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Projects',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Wix Bold')),
                                              ]),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 800),
                                          child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Color(0xFFDFDFDF)
                                                        .withOpacity(0.6),
                                                    fontSize: 16),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          "Here's a collection of my artistic creations, each reflecting my vision and passion for creativity. From vibrant illustrations to striking designs, this gallery showcases the diverse styles that inspire me.",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Wix Regular')),
                                                ]),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 1200),
                                          child: Wrap(
                                            spacing: 40,
                                            runSpacing: 40,
                                            children: [
                                              HoverImage(
                                                  imagePath:
                                                      'assets/POSTER - 1.png'),
                                              HoverImage(
                                                  imagePath:
                                                      'assets/POSTER - 2.png'),
                                              HoverImage(
                                                  imagePath:
                                                      'assets/POSTER - 3.png'),
                                              HoverImage(
                                                  imagePath:
                                                      'assets/POSTER - 4.png'),
                                              HoverImage(
                                                  imagePath:
                                                      'assets/POSTER - 5.png'),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 200,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Color(0xFFDFDFDF),
                                                  fontSize: 40),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Contact',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Wix Bold')),
                                              ]),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 800),
                                          child: RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Color(0xFFDFDFDF)
                                                        .withOpacity(0.6),
                                                    fontSize: 16),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          "Helo, If you’re curious about my work or have a project brewing in your mind, let’s talk! I’m always excited to connect and collaborate. Don’t hesitate to reach out!",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Wix Regular')),
                                                ]),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text(
                                          "Address",
                                          style: TextStyle(
                                              fontFamily: 'Wix Regular',
                                              fontSize: 18,
                                              color: Color(0xFFDFDFDF)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "404 Ain't Telling You St., E-mail Me Instead Subd.",
                                          style: TextStyle(
                                              fontFamily: 'Wix Regular',
                                              fontSize: 16,
                                              color: Color(0xFFDFDFDF)
                                                  .withOpacity(0.6)),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "E-mail",
                                          style: TextStyle(
                                              fontFamily: 'Wix Regular',
                                              fontSize: 18,
                                              color: Color(0xFFDFDFDF)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "mjrpigao@addu.edu.ph",
                                          style: TextStyle(
                                              fontFamily: 'Wix Regular',
                                              fontSize: 16,
                                              color: Color(0xFFDFDFDF)
                                                  .withOpacity(0.6)),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 250,
                                        ),
                                        Text(
                                          "All rights reserved © 2024 MAVERICK",
                                          style: TextStyle(
                                              fontFamily: 'Wix Regular',
                                              fontSize: 14,
                                              color: Color(0xFFDFDFDF)
                                                  .withOpacity(0.6)),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 100,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF252525),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 50]),
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        width: 65,
                        child: InkWell(
                          onTap: () {
                            _scrollController.animateTo(
                              0,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Image.asset(
                            'assets/MAVERICK - LOGO Cut.png',
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _scrollController.animateTo(
                              MediaQuery.of(context).size.height + 450,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "PROJECTS",
                            style: TextStyle(
                                fontFamily: 'Wix Bold',
                                color: Color(0xFFDFDFDF).withOpacity(0.6)),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                          onTap: () {
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent - 100,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            "CONTACT",
                            style: TextStyle(
                                fontFamily: 'Wix Bold',
                                color: Color(0xFFDFDFDF).withOpacity(0.6)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Color(0xFF252525)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 50]),
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: Container(
                width: 25,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _launchURL('https://github.com/MABURIKU');
                      },
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          'assets/ICON - Github.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL('https://www.behance.net/MABURIKU');
                      },
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          'assets/ICON - Behance.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL('https://www.linkedin.com/in/maburiku/');
                      },
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          'assets/ICON - LinkedIn.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}
