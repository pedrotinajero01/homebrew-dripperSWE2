import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';
import '../utils/coffee_data.dart' as utils;

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;
  int minutes;
  int seconds;
  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;
    minutes = stepTimeRemaining % 60;
    seconds = stepTimeRemaining - 60 * minutes;
    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xff4c748b),
      body: ListView(
        children: [
          SizedBox(height: 50),
          Text(
            "${stepTimeRemaining}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 96),
          ),
          SizedBox(height: 60),
          Text(
            "${currentRecipeStep.text}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 50),
          Text(
            " Steps",
            key: Key("steps"),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          for (RecipeStep step in remainingSteps)
            if (step ==
                currentRecipeStep) //to make a border around ONLY the current step
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.transparent,
                ),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(
                    step.text,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: Text(
                    utils.toMinuteFormat(step.time),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            else
              ListTile(
                title: Text(
                  step.text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: Text(
                  utils.toMinuteFormat(step.time),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
