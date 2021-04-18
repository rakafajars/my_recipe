import 'package:flutter/material.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';

class HomeSearchRecipe extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const HomeSearchRecipe({
    Key key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 31,
        right: 31,
      ),
      decoration: BoxDecoration(
        color: whiteColor1,
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_sharp,
            size: 14,
            color: blackColor.withOpacity(
              0.6,
            ),
          ),
          hintText: 'Cari Resep Favorit Kamu',
          hintStyle: myNunitoSans.headline3.copyWith(
            fontSize: 14,
            color: blackColor.withOpacity(
              0.6,
            ),
          ),
        ),
      ),
    );
  }
}
