import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color kMainColor = Color(0xFF729E41);

class BoardingScreens {
  String image;
  String title;
  String subTitle;
  BoardingScreens({this.image, this.title, this.subTitle});
}

class SharedPrefShop {
  static SharedPreferences sharedPreferences;

  static sharedDefinition() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static putData(String key, dynamic value) async {
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      print('bool data puted');
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      print('bool data puted');
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getData(String key) {
    return sharedPreferences.get(key);
  }

  static dynamic removeData(String key) {
    return sharedPreferences.remove(key);
  }
}

Widget defaultFormField({
  TextEditingController controller,
  TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  Function validate,
  String label,
  IconData prefix,
  IconData suffix,
  int maxLines,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
