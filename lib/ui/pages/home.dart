import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: Color(
            0xFFFFFFFF,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 31,
                    ),
                    child: Icon(
                      Icons.notes_outlined,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 31,
                    ),
                    child: Text(
                      'Mau Masak Apa\nHari Ini ?',
                      style: GoogleFonts.halant(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Color(
                          0xFF0F0F11,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 31,
                      right: 31,
                    ),
                    decoration: BoxDecoration(
                        color: Color(
                          0xFFF6F7FC,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        )),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          size: 14,
                          color: Color(
                            0xFF0F0F11,
                          ).withOpacity(
                            0.6,
                          ),
                        ),
                        hintText: 'Cari Resep Favorit Kamu',
                        hintStyle: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(
                            0xFF0F0F11,
                          ).withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 31,
                    ),
                    child: Text(
                      'Resep Terbaru',
                      style: GoogleFonts.halant(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        color: Color(
                          0xFF0F0F11,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: sy(200),
                    width: double.infinity,
                    child: ListView(
                      padding: EdgeInsets.only(
                        left: 31,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: sy(200),
                              width: sy(150),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                                child: Image.asset(
                                  'assets/splash_screen.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
