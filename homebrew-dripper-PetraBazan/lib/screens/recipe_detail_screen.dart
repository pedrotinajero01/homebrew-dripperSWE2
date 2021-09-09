import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import '../utils/coffee_data.dart' as utils;
import 'dart:async';

class RecipeDetailScreen extends StatelessWidget {
  RecipeDetailScreen(this.recipe);
  CoffeeRecipe recipe;

  List<RecipeStep> allstep;
  @override
  Widget build(BuildContext context) {
    allstep = recipe.steps;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 13,
                ),
                IconButton(
                  key: Key('BackButton'),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff4C748B),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
              height: 164,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Color(0xff4C748B),
                  width: 3,
                ),
              ),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 10)),
                  Text(recipe.name,
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: 'Kollektiff',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4C748B),
                      )),
                  Padding(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5)),
                  Divider(
                    color: Color(0xff4C748B),
                    indent: 25,
                    endIndent: 25,
                    thickness: 1.5,
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 10)),
                  //ingredients
                  Text(
                      "${recipe.coffeeVolumeGrams}${"g - "}${recipe.grindSize}",
                      key: Key("GramsofCoffee"),
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: Color(0xff4C748B),
                        fontFamily: 'Kollektiff',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                  Text("${recipe.waterVolumeGrams}${"g - water"}",
                      key: Key("GramsofWater"),
                      style: TextStyle(
                        letterSpacing: 1.5,
                        color: Color(0xff4C748B),
                        fontFamily: 'Kollektiff',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      )),
                  Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 20)),
                  Text(recipe.miscDetails,
                      key: Key('originalRecipe'),
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontFamily: 'montserrat.regular',
                        fontStyle: FontStyle.italic,
                        color: Color(0xff4C748B),
                        fontSize: 10,
                      )),
                ],
              )),

          SizedBox(
            height: 20.0,
          ),

          new Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Steps",
                      style: TextStyle(
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                  width: 210,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        child: Text(
                      "Total: " + totalTime(recipe),
                      style: TextStyle(
                        letterSpacing: 1.0,
                      ),
                    ))),
              ],
            ),
          ),

          for (RecipeStep step in allstep)
            Container(
              height: 40,
              width: .93 * width,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff4C748B), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.transparent,
              ),
              margin: EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      step.text,
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Color(0xff4C748B),
                          fontSize: 12,
                          fontFamily: 'Kollektiff'),
                    ),
                    Text(
                      utils.toMinuteFormat(step.time),
                      style: TextStyle(
                          letterSpacing: 1.0,
                          color: Color(0xff4C748B),
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

          //start button
          Padding(padding: const EdgeInsets.fromLTRB(10, 30, 10, 30)),
          new SizedBox(
              width: 260,
              height: 40,
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                key: Key('StartButton'),
                color: Color(0xff4C748B),
                child: Text("Start",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'montserrat.regular',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffffffff),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe)),
                  );
                },
              ))
        ],
      ),
    ));
  }
}
