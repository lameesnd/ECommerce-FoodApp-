import 'package:ecomm_food_app/home/icon_and_text_widget.dart';
import 'package:ecomm_food_app/utils/colors.dart';
import 'package:ecomm_food_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_food_app/widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
      viewportFraction: 0.9); // visibility of next and previous slides
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  var _height = 220;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _builPageItem(position);
          }),
    );
  }

  Widget _builPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // after scaling set the transition value
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // after scaling set the transition value
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // after scaling set the transition value
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8; //set this scale for the rest of the conditions
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/pizza2.png",
                    ))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 130,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 2.0,
                    offset: Offset(0,5)// no x-axis shadow, 5px for the y-axis
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Pizza'),
                    SizedBox(height: 10),
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
                        SizedBox(width: 10),
                        SmallText(text: '4.5'),
                        SizedBox(width: 10),
                        SmallText(text: '1287'),
                        SizedBox(width: 10),
                        SmallText(text: 'comments')
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle,
                            text: 'Normal',
                            iconColor: AppColors.iconColor1),
                        SizedBox(
                          width: 20,
                        ),
                        IconAndTextWidget(
                            icon: Icons.location_on_outlined,
                            text: '1.7km',
                            iconColor: AppColors.mainColor),
                        SizedBox(
                          width: 20,
                        ),
                        IconAndTextWidget(
                            icon: Icons.access_time,
                            text: '32min',
                            iconColor: AppColors.iconColor2),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
