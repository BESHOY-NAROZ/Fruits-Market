import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_t_fruit_app/constants.dart';
import 'package:s_t_fruit_app/networking/fruit_cubit.dart';
import 'package:s_t_fruit_app/networking/fruit_dio.dart';
import 'package:s_t_fruit_app/widgets/splash_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FruitDio.defineDio();
  SharedPrefShop.sharedDefinition();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return FruitCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashWidget(),
      ),
    );
  }
}
