import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:s_t_fruit_app/constants.dart';
import 'file:///C:/Users/besho/AndroidStudioProjects/s_t_fruit_app/lib/widgets/login_widget/login_widget.dart';
import 'package:s_t_fruit_app/size_config.dart';

class OnBoardingBody extends StatefulWidget {
  @override
  _OnBoardingBodyState createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController pageController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    List<BoardingScreens> boardingList = [
      BoardingScreens(
        image: 'assets/images/onboarding1.png',
        title: 'E Shopping',
        subTitle: 'Explore  top organic fruits & grab them',
      ),
      BoardingScreens(
          image: 'assets/images/onboarding2.png',
          title: 'Delivery on the way',
          subTitle: 'Get your order by speed delivery'),
      BoardingScreens(
          image: 'assets/images/onboarding3.png',
          title: 'Delivery Arrived',
          subTitle: 'Order is arrived at your Place'),
    ];
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
          onPageChanged: (int pagesNumber) {
            if (pagesNumber == boardingList.length - 1) {
              setState(() {
                isLast = true;
              });
            }
          },
          itemCount: boardingList.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.defaultSize * 14,
                ),
                SizedBox(
                    height: SizeConfig.defaultSize * 25,
                    child: Image.asset(boardingList[index].image)),
                SizedBox(
                  height: SizeConfig.defaultSize * 4,
                ),
                Text(
                  boardingList[index].title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize * 2,
                ),
                Text(
                  boardingList[index].subTitle,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: SizeConfig.defaultSize * 6,
          right: SizeConfig.defaultSize * .1,
          child: FlatButton(
              onPressed: () {},
              child: Text(
                'skip',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize * 8,
          right: SizeConfig.defaultSize * 10,
          left: SizeConfig.defaultSize * 10,
          child: Container(
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: MaterialButton(
              onPressed: () {
                if (isLast) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginWidget()),
                          (route) => false);
                }
                else{
                  pageController.nextPage(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn);
                }

              },
              child: Text(
                'Next',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
