import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_t_fruit_app/constants.dart';
import 'package:s_t_fruit_app/networking/fruit_cubit.dart';
import 'package:s_t_fruit_app/networking/fruit_states.dart';
import 'package:s_t_fruit_app/payment/request_payment.dart';
import 'package:s_t_fruit_app/size_config.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FruitCubit, FruitStates>(
      listener: (BuildContext context, FruitStates state) {},
      builder: (BuildContext context, FruitStates state) {
        FruitCubit fruitCubit = FruitCubit.getShopCubit(context);
        return Column(
          children: <Widget>[
            SizedBox(
                width: double.infinity, height: SizeConfig.defaultSize * 10),
            SizedBox(
                height: SizeConfig.defaultSize * 30,
                width: SizeConfig.defaultSize * 30,
                child: Image.asset('assets/images/logo.png')),
            Text(
              'Fruit Market',
              style: TextStyle(
                  color: kMainColor, fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.white,
                      shape: Border.all(color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestPayment(),
                          ),
                        );
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => CompleteUserInfo()),
                        //     (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: SizeConfig.defaultSize * 0.5,
                          ),
                          Text(
                            'log in with',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.defaultSize * 2,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.white,
                      shape: Border.all(color: Colors.grey),
                      onPressed: () async {
                        await fruitCubit.signInWithGoogle();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: SizeConfig.defaultSize * 0.5,
                          ),
                          Text(
                            'log in with',
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
