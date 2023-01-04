import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riveanime/src/constants/colors.dart';
import 'package:riveanime/src/screens/mainscreen.dart';
import 'package:riveanime/src/screens/onboarding.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 520,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 36, fontFamily: 'Poppins'),
                ),
              ),
            ),
            const SizedBox(
              width: 300,
              child: Center(
                  child: Text(
                'Access to 240+ hours of content. Learn design and code, by building real apps with React and Flutter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Intel'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Email',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email Here...',
                          prefixIcon:
                              SvgPicture.asset('assets/icons/Email.svg'),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: pink, width: 1),
                          ),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Password',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Password...',
                          prefixIcon: SvgPicture.asset('assets/icons/Lock.svg'),
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white70,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: black, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: pink, width: 1),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnBoard()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 56),
                            backgroundColor: pink,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    topRight: Radius.circular(25)))),
                        icon: Icon(Icons.arrow_forward),
                        label: Text('Sign in')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: const [
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                        )),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('OR'),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1.5,
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: (() {}),
                          icon: SvgPicture.asset('assets/icons/Email.svg')),
                      IconButton(
                          onPressed: (() {}),
                          icon: SvgPicture.asset('assets/icons/Apple.svg')),
                      IconButton(
                          onPressed: (() {}),
                          icon: SvgPicture.asset('assets/icons/Google.svg'))
                    ],
                  )
                ],
              )),
            )
          ],
        ),
      ),
    ));
  }
}
