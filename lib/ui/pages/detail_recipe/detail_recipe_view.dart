import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class DetailRecipeView extends StatelessWidget {
  final String imageUrl;

  const DetailRecipeView({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: Stack(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: imageUrl,
                    child: Image.network(
                      imageUrl,
                      // height: sy(256),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 35,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.arrow_back_outlined,
                            size: 18,
                            color: whiteColor,
                          ),
                          Container(
                            height: sy(36),
                            width: sy(36),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                15,
                                15,
                                17,
                                0.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.bookmark,
                                size: sy(18),
                                color: Color(
                                  0xFF1DA183,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.7,
                minChildSize: 0.7,
                maxChildSize: 1,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          24,
                        ),
                        topRight: Radius.circular(
                          24,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 155,
                            right: 155,
                          ),
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFF0F0F11).withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 31,
                                ),
                                child: Text(
                                  'Gulai Kambing\nRica Rica',
                                  style: myHalant.subtitle2.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 28,
                                    color: blackColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),

                              /// Informasi Masak
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 31,
                                  right: 31,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: grenColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '10 Menit',
                                          style:
                                              myNunitoSans.headline1.copyWith(
                                            color: grenColor,
                                            fontSize: 15,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: grenColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Mudah',
                                          style:
                                              myNunitoSans.headline1.copyWith(
                                            color: grenColor,
                                            fontSize: 15,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.people,
                                          color: grenColor,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '2 Servings',
                                          style:
                                              myNunitoSans.headline1.copyWith(
                                            color: grenColor,
                                            fontSize: 15,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),

                              /// Menu Resep
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 31,
                                  right: 31,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ingredients',
                                          style: myHalant.headline6.copyWith(
                                            fontSize: 20,
                                            fontStyle: FontStyle.normal,
                                            color: blackColor,
                                          ),
                                        ),
                                        Text(
                                          '4 Items',
                                          style: myHalant.headline6.copyWith(
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              color: blackColor.withOpacity(
                                                0.5,
                                              ),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: sy(10),
                                              width: sy(10),
                                              decoration: BoxDecoration(
                                                color: grenColor,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              'Daging Kambing Segar',
                                              style: myNunitoSans.headline5
                                                  .copyWith(
                                                fontSize: 14,
                                                color: blackColor.withOpacity(
                                                  0.8,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '500 gr',
                                          style:
                                              myNunitoSans.headline5.copyWith(
                                            fontSize: 14,
                                            color: blackColor.withOpacity(
                                              0.8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),

                              //  Cara Masak
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 31,
                                  right: 31,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Directions',
                                      style: myHalant.headline6.copyWith(
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal,
                                        color: blackColor,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5.0,
                                          ),
                                          child: Text(
                                            '1',
                                            style: myHalant.headline6.copyWith(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              color: blackColor.withOpacity(
                                                0.8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40.0,
                                          width: 0.8,
                                          color: grenColor,
                                          margin: const EdgeInsets.only(
                                            top: 8.0,
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            child: Text(
                                              'Presto daging kambing dengan daun salam,serai,daun jeruk dan lain2 sampai empuk',
                                              style: myNunitoSans.headline5
                                                  .copyWith(
                                                fontSize: 14,
                                                fontStyle: FontStyle.normal,
                                                color: blackColor.withOpacity(
                                                  0.8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5.0,
                                          ),
                                          child: Text(
                                            '1',
                                            style: myHalant.headline6.copyWith(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              color: blackColor.withOpacity(
                                                0.8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40.0,
                                          width: 0.8,
                                          color: grenColor,
                                          margin: const EdgeInsets.only(
                                            top: 8.0,
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            child: Text(
                                              'Presto daging kambing dengan daun salam,serai,daun jeruk dan lain2 sampai empuk',
                                              style: myNunitoSans.headline5
                                                  .copyWith(
                                                fontSize: 14,
                                                fontStyle: FontStyle.normal,
                                                color: blackColor.withOpacity(
                                                  0.8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 5.0,
                                          ),
                                          child: Text(
                                            '1',
                                            style: myHalant.headline6.copyWith(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              color: blackColor.withOpacity(
                                                0.8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 40.0,
                                          width: 0.8,
                                          color: grenColor,
                                          margin: const EdgeInsets.only(
                                            top: 8.0,
                                            left: 10.0,
                                            right: 10.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            child: Text(
                                              'Presto daging kambing dengan daun salam,serai,daun jeruk dan lain2 sampai empuk',
                                              style: myNunitoSans.headline5
                                                  .copyWith(
                                                fontSize: 14,
                                                fontStyle: FontStyle.normal,
                                                color: blackColor.withOpacity(
                                                  0.8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
