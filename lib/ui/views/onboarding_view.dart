import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  double currentIndexPage;
  int pageLength;

  List<Map> slides = [
    {
      'image': 'undraw_Hello_qnas.svg',
      'text': 'Welcome to DigiPol! Where digital direct democracy starts.'
    },
    {
      'image': 'undraw_process_e90d.svg',
      'text':
          'DigiPol collates all the current bills in the Australian goverment for you.'
    },
    {
      'text':
          'You can vote on whichever bills you\'d like to. If you vote twice, your new vote will replace your previous one.',
    }
    // {
    //   'image': 'undraw_voting_nvu7.svg',
    //   'text':
    //       'So you can stay informed & make your opinion known when it matters most.'
    // },
    // {
    //   'image': 'undraw_new_ideas_jdea.svg',
    //   'text': 'You can even vote on current issues created by the community.'
    // },
    // {
    //   'image': 'undraw_ethereum_fb7n.svg',
    //   'text':
    //       'None of your personal information is stored, and all votes are verified by the ethereum blockchain.'
    // }
  ];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = slides.length;
  }

  @override
  Widget build(BuildContext context) {
    // double marginFromSafeArea = 24;
    // var heightOfScreen =
    //     MediaQuery.of(context).size.height - marginFromSafeArea;
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: heightOfScreen * 0.6,
              child: PageView(
                children: <Widget>[
                  _buildWalkThrough(),
                  _buildWalkThrough(),
                  _buildWalkThrough()
                ],
                onPageChanged: (value) {
                  setState(() => currentIndexPage = value.toDouble());
                },
              ),
            ),
            Container(
              height: heightOfScreen * 0.1,
              child: DotsIndicator(
                dotsCount: pageLength,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  color: Colors.blue,
                  activeColor: Colors.red,
                ),
              ),
            ),
            Container(height: heightOfScreen * 0.2)
          ],
        ),
      )),
    );
  }
}

Widget _buildWalkThrough(context, graphic, text) {
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              // Image.asset(
              //   "assets/graphics/vote.png",
              // ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: (graphic.type == "svg" ? SvgPicture : Image).asset(
                      'assets/graphics/${graphic.fileName}',
                      semanticsLabel: graphic.label),
                ),
              ),
              ListBody(
                mainAxis: Axis.vertical,
                children: <Widget>[
                  Text(
                    "StringConst.JOIN",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
