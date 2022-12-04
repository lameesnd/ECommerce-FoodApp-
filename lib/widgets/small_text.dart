import 'package:ecomm_food_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow? overFlow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.height = 1.2,
      this.size = 0,
      this.overFlow = TextOverflow.clip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 1,
      style: TextStyle(
        overflow: overFlow,
        color: color,
        fontSize: size == 0 ? Dimensions.font12 : size,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
