import 'package:flutter/material.dart';
import 'package:s_t_fruit_app/constants.dart';

import 'file:///C:/Users/besho/AndroidStudioProjects/s_t_fruit_app/lib/widgets/onBoarding_widget/onBoarding_widget.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.repeat(reverse: true);

    goToNextScreen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        children: <Widget>[
          Spacer(),
          AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Opacity(
                    opacity: animation.value,
                    child: Text(
                      'Fruit Market',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 51,
                          color: Colors.white),
                    ),
                  )),
          Image.asset(
            'assets/images/splash_view_image.png',
          )
        ],
      ),
    );
  }

  goToNextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingWidget(),
        ),
        (route) => false,
      );
    });
  }
}
