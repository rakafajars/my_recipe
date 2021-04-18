import 'package:flutter/material.dart';
import 'package:food_recipe/model/m_detail_recipe.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';

class DetailDirectionsRecipe extends StatelessWidget {
  final ModelDetailRecipe modelDetailRecipe;

  const DetailDirectionsRecipe({
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              modelDetailRecipe.results.step.length,
              (index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.0,
                      width: 0.8,
                      color: grenColor,
                      margin: const EdgeInsets.only(
                        top: 8.0,
                        right: 10.0,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Text(
                          modelDetailRecipe.results.step[index],
                          style: myNunitoSans.headline5.copyWith(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
