import 'package:flutter/material.dart';
import 'package:s_t_fruit_app/size_config.dart';
import 'package:s_t_fruit_app/widgets/onBoarding_widget/OnBoarding_body.dart';

class OnBoardingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: OnBoardingBody(),
    );
  }
}
