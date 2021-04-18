import 'package:flutter/material.dart';
import 'package:food_recipe/model/m_detail_recipe.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';
import 'package:relative_scale/relative_scale.dart';

class DetailIngredientsRecipe extends StatelessWidget {
  final ModelDetailRecipe modelDetailRecipe;

  const DetailIngredientsRecipe({
    Key key,
    this.modelDetailRecipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 31,
            right: 31,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    '${modelDetailRecipe.results.ingredient.length} Items',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  modelDetailRecipe.results.ingredient.length,
                  (index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
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
                        Expanded(
                          child: Text(
                            modelDetailRecipe.results.ingredient[index],
                            style: myNunitoSans.headline5.copyWith(
                              fontSize: 14,
                              color: blackColor.withOpacity(
                                0.8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
