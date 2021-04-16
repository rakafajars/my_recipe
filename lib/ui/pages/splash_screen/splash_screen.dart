import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';
import 'package:food_recipe/ui/pages/home/home.dart';
import 'package:relative_scale/relative_scale.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/splash_screen.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
              Container(
                height: sy(200),
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2K+ Resep Pilihan Terbaik',
                      style: myNunitoSans.headline2.copyWith(
                        fontSize: 18,
                        color: whiteColor.withOpacity(
                          0.8,
                        ),
                      ),
                    ),
                    Text(
                      'Premium\nRecipe\nFor You!',
                      style: myHalant.headline6.copyWith(
                        fontSize: 32,
                        color: whiteColor,
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Get Started',
                        style: myHalant.headline6.copyWith(
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          grenColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
