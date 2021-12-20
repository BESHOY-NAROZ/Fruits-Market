import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:s_t_fruit_app/networking/fruit_dio.dart';
import 'package:s_t_fruit_app/networking/fruit_states.dart';
// import 'package:http/http.dart' as http;

class FruitCubit extends Cubit<FruitStates> {
  FruitCubit() : super(FruitInitialState());

  static FruitCubit getShopCubit(context) => BlocProvider.of(context);

  signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print('int token is ${value.user.uid}');
    });
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //
  //   final AccessToken loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<String> cubitPostForToken(
      {String tokenUrl, String cardNumber, int expMonth, int expYear}) async {
    String response;
    await FruitDio.dioPostData(
      url: tokenUrl,
      data: {
        'type': 'card',
        'number': cardNumber,
        'expiry_month': expMonth,
        'expiry_year': expYear
      },
      key: 'pk_test_4c168d25-96f0-4569-a60e-8d8e5fe70080',
    ).then((value) {
      response = value.data['token'];
      print('response is ${response.toString()}');
    }).catchError((error) {
      print(error.toString());
    });
    return response;
  }

  cubitPostForPayment(
      {String tokenUrl,
      String cardNumber,
      int expMonth,
      int expYear,
      String paymentUrl,
      String currency,
      int amount}) async {
    String token = await cubitPostForToken(
        tokenUrl: tokenUrl,
        cardNumber: cardNumber,
        expMonth: expMonth,
        expYear: expYear);
    FruitDio.dioPostData(
            url: paymentUrl,
            data: {
              'source': {'type': 'token', 'token': token},
              'currency': currency,
              'amount': amount
            },
            key: 'sk_test_51564510-e066-45da-b998-ee8e5626e1c7')
        .then((value) {
      bool response = value.data['approved'];
      print(response.toString());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
