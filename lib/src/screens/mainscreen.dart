import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;
    late RiveAnimationController controller;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
          child: Text(
        'hello',
        style:
            TextStyle(fontFamily: 'Poppins', color: Colors.white, fontSize: 20),
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: size.width * .145,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.white,
          ),
          color: Color.fromARGB(216, 24, 34, 60),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(115, 0, 0, 0).withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            splashColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : size.width * .039,
                    right: size.width * .04,
                    left: size.width * .04,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDEE3EC),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 40, height: 30, child: listOfIcons[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> listOfIcons = [
    const RiveAnimation.asset(
      'assets/rive/icons.riv',
      artboard: 'HOME',
      animations: ['active'],
      fit: BoxFit.contain,
    ),
    const RiveAnimation.asset(
      'assets/rive/icons.riv',
      artboard: 'CHAT',
      fit: BoxFit.contain,
    ),
    const RiveAnimation.asset(
      'assets/rive/icons.riv',
      artboard: 'SEARCH',
      fit: BoxFit.scaleDown,
    ),
    const RiveAnimation.asset(
      'assets/rive/icons.riv',
      artboard: 'TIMER',
      fit: BoxFit.scaleDown,
    ),
  ];
}
