import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/ui/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white.withOpacity(
                          0.8,
                        ),
                      ),
                    ),
                    Text(
                      'Premium\nRecipe\nFor You!',
                      style: GoogleFonts.halant(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.halant(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF1DA183),
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
