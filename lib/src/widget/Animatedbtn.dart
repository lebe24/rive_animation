import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    Key? key,
    required RiveAnimationController btnController,
    required this.press,
  })  : _btnControl = btnController,
        super(key: key);

  final RiveAnimationController _btnControl;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: press,
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.2,
        child: Stack(
          children: [
            Stack(
              children: [
                 RiveAnimation.asset('assets/rive/button.riv',
                controllers: [_btnControl],
              ),
                Positioned.fill(
                  top: 8,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.play_circle,
                          size: 30,
                        ),
                        Text(
                          'Start Course',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
