import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:s_t_fruit_app/networking/fruit_cubit.dart';
import 'package:s_t_fruit_app/networking/fruit_states.dart';

class RequestPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FruitCubit, FruitStates>(
      listener: (BuildContext context, FruitStates state) {},
      builder: (BuildContext context, FruitStates state) {
        FruitCubit fruitCubit = FruitCubit.getShopCubit(context);

        return Scaffold(
          body: Center(child: Text('Payment')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // fruitCubit.cubitPostForToken(
              //   tokenUrl: 'tokens',
              //   cardNumber: '4242424242424242',
              //   expMonth: 12,
              //   expYear: 2021,
              // );
              fruitCubit.cubitPostForPayment(
                  tokenUrl: 'tokens',
                  cardNumber: '4242424242424242',
                  expMonth: 12,
                  expYear: 2021,
                  paymentUrl: 'payments',
                  amount: 10000000,
                  currency: 'USD');
            },
            child: Icon(FontAwesomeIcons.plus),
          ),
        );
      },
    );
  }
}
