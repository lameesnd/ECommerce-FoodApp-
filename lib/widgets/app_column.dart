import 'package:ecomm_food_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15,top: Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text,size: Dimensions.font26,),
          SizedBox(height: Dimensions.height10),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          color: AppColors.mainColor,
                        )),
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: '4.5'),
              SizedBox(width: Dimensions.width10),
              SmallText(text: '1287'),
              SizedBox(width: Dimensions.width10),
              SmallText(text: 'comments')
            ],
          ),
          SizedBox(height: Dimensions.height10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                  icon: Icons.circle,
                  text: 'Normal',
                  iconColor: AppColors.iconColor1),
              IconAndTextWidget(
                  icon: Icons.location_on_outlined,
                  text: '1.7km',
                  iconColor: AppColors.mainColor),
              IconAndTextWidget(
                  icon: Icons.access_time,
                  text: '32min',
                  iconColor: AppColors.iconColor2),
            ],
          )
        ],
      ),
    );
  }
}
