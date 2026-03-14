import 'package:flutter/material.dart';

import '../../../../../core/values/app_styles.dart';
class CustomForgetPasswordTextWidget extends StatelessWidget {
  String text1 ;
  String text2 ;
  CustomForgetPasswordTextWidget({required this.text1,required this.text2});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: [
          Text(text1,style: AppStyles.medium18Black,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            child: Text(text2,style: AppStyles.regular14DarkGray,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
