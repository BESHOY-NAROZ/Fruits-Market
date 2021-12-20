import 'package:flutter/material.dart';
import 'package:s_t_fruit_app/constants.dart';
import 'package:s_t_fruit_app/size_config.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController addressController = TextEditingController();

class CompleteUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.defaultSize * 5,
              ),
              Text(
                'Enter your name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              defaultFormField(
                controller: nameController,
                maxLines: 1,
                onSubmit: (String text) {
                },

              ),
              SizedBox(
                height: SizeConfig.defaultSize * 3,
              ),
              Text(
                'Enter your phone',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              defaultFormField(
                controller: phoneController,
                maxLines: 1,
                type: TextInputType.number,
                onSubmit: (String text) {},
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 3,
              ),
              Text(
                'Enter your address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              defaultFormField(
                controller: addressController,
                maxLines: 5,
                onSubmit: (String text) {},
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 8,
              ),
              Container(
                width: SizeConfig.defaultSize * 21.5,
                decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
