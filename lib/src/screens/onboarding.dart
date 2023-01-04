import 'package:flutter/material.dart';
import 'package:riveanime/src/constants/colors.dart';
import 'dart:math';

import 'package:riveanime/src/screens/mainscreen.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Dashboard(),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 700),
            builder: (_, double val, __) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 150 * val)
                ..rotateY((pi / 6) * val),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const MainScreen()),
            ),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) => {
              if (e.delta.dx > 0)
                {
                  setState(() {
                    value = 1;
                  })
                }
              else
                {
                  setState(() {
                    value = 0;
                  })
                }
            },
          )
        ],
      ),
    );
  }

  Container Dashboard() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF101629),
            Color(0xFF394156),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.repeated,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10),
          child: Column(
            children: [
              Avatar(), 
              Container()],
          ),
        ),
      ),
    );
  }
}



class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          CircleAvatar(
            radius: 33,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Text(
                  'Meng To',
                  style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
                ),
                Text(
                  'UI Designer',
                  style:
                      TextStyle(color: Color(0xFF555353), fontFamily: 'Intel'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
