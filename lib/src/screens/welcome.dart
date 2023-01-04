import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:riveanime/src/constants/colors.dart';
import 'package:riveanime/src/widget/Animatedbtn.dart';
import 'package:riveanime/src/widget/Signup.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late RiveAnimationController _btnController;

  @override
  void initState() {
    // TODO: implement initState
    _btnController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgbImage(),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 38.0, vertical: 60.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                      'Learn design & code',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontSize: 56, height: 1.2),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                        'Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.'),
                  ),
                  Spacer(),
                  AnimatedBtn(
                    press: () {
                      _btnController.isActive = true;
                      Future.delayed(
                          Duration(
                            milliseconds: 800,
                          ), () {
                        customsDialog(context);
                      });
                    },
                    btnController: _btnController,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.',
                      style: TextStyle(fontFamily: 'Intel', fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> customsDialog(BuildContext context) {
    return showGeneralDialog(
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionBuilder: ((context, animation, secondaryAnimation, child) {
          Tween<Offset> tween;
          tween = Tween(begin: Offset(0, -1), end: Offset.zero);
          return SlideTransition(
              child: child,
              position: tween.animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut)));
        }),
        barrierLabel: 'Sign up',
        context: context,
        pageBuilder: ((context, _, __) =>
            Stack(clipBehavior: Clip.antiAlias, children: [
              Signup(),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.15,
                right: MediaQuery.of(context).size.width * 0.45,
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ])));
  }
}

Widget backgbImage() {
  return Stack(
    children: [
      Positioned(
          bottom: 50,
          right: -108,
          child: Image.asset(
            'assets/icons/Spline.png',
            height: 320,
          )),
      Positioned.fill(
          child: BackdropFilter(
              child: SizedBox(),
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5))),
      const RiveAnimation.asset('assets/rive/shapes.riv'),
      Positioned.fill(
          child: BackdropFilter(
              child: SizedBox(),
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10))),
    ],
  );
}
