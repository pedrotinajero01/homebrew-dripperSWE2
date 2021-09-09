import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 1),
    RecipeStep("Cover and wait", 1), //5
    RecipeStep("Stir", 1), //5
    RecipeStep("Cover and wait", 1), //5
    RecipeStep("Stir", 1), //5
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Test Recipe", 22, 360,
      "finely ground coffee", "Testing, Testing, 123", steps);
  return recipe;
}

CoffeeRecipe makeTest2Recipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 2),
    RecipeStep("Cover and wait", 2), //5
    RecipeStep("Stir", 2), //5
    RecipeStep("Cover and wait", 2), //5
    RecipeStep("Stir", 2), //5
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Another Test Recipe", 22, 360, "finely ground coffee", "TEST", steps);
  return recipe;
}

//Added other recipes, all recipes now have their correct ratios and times
CoffeeRecipe makePTsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 450g water", 30),
    RecipeStep("Cover and wait", 120),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 240),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("PT's", 25, 450, "medium-coarse",
      "Recipe from the famous Pedro Tinajero ;)", steps);
  return recipe;
}

CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 150),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 100),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Texas Coffee School", 24, 340,
      "finely ground coffee", "Don't Mess with Texas!! >:(", steps);
  return recipe;
}

CoffeeRecipe makeHomegroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 120),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 180),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Homegrounds", 23, 345,
      "finely ground coffee", "Not your average Home(Grounds)", steps);
  return recipe;
}

//formatting tool to display time as "00:06", "00:42", "01:09", "14:20" or "69:00"
String toMinuteFormat(int secondsInput) {
  int minutes = secondsInput ~/ 60;

  if (minutes < 10) {
    // will show "00:0X" or "0X:0X"
    if (secondsInput % 60 < 10) {
      return "0" +
          minutes.toString() +
          ":0" +
          (secondsInput - minutes * 60).toString();
    } else
      // will show "00:XX" or "0X:XX"
      return "0" +
          minutes.toString() +
          ":" +
          (secondsInput - minutes * 60).toString();
  } else {
    if (secondsInput % 60 < 10) {
      // will show "XX:0X"
      return minutes.toString() +
          ":0" +
          (secondsInput - minutes * 60).toString();
    } else if (secondsInput % 60 == 0) {
      // will show "XX:00"
      return minutes.toString() + ":00";
    }
    // will show "XX:XX"
    return minutes.toString() + ":" + (secondsInput - minutes * 60).toString();
  }
}

// will give us the total time it takes to make the coffee
String totalTime(CoffeeRecipe reck) {
  int total = 0;

  for (RecipeStep step in reck.steps) {
    total += step.time;
  }
  return toMinuteFormat(total);
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makeTestRecipe(),
    makePTsRecipe(),
    makeTexasCoffeeSchoolRecipe(),
    makeHomegroundsRecipe(),
    makeTest2Recipe()
  ]; //function must return all recipes, added the new recipes
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
