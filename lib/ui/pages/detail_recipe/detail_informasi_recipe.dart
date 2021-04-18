import 'package:flutter/material.dart';
import 'package:food_recipe/model/m_detail_recipe.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';

class DetailInformasiRecipe extends StatelessWidget {
  final ModelDetailRecipe modelDetailRecipe;

  const DetailInformasiRecipe({
    Key key,
    this.modelDetailRecipe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 31,
        right: 31,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/clock.png',
                height: 15,
                width: 15,
                color: grenColor,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                modelDetailRecipe.results.times,
                style: myNunitoSans.headline1.copyWith(
                  color: grenColor,
                  fontSize: 15,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 2,
          ),
          Row(
            children: [
              Image.asset(
                'assets/kesulitan.png',
                height: 15,
                width: 15,
                color: grenColor,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                modelDetailRecipe.results.dificulty,
                style: myNunitoSans.headline1.copyWith(
                  color: grenColor,
                  fontSize: 15,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 2,
          ),
          Row(
            children: [
              Image.asset(
                'assets/person.png',
                height: 15,
                width: 15,
                color: grenColor,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                modelDetailRecipe.results.servings,
                style: myNunitoSans.headline1.copyWith(
                  color: grenColor,
                  fontSize: 15,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
