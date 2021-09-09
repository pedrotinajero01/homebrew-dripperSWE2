import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts

    //checking the number of grams for coffee
    if (coffeeVolumeGrams > 0) {
      this.coffeeVolumeGrams = coffeeVolumeGrams;
    } else {
      throw ArgumentError();
    }

    //checking the volume of water
    if (waterVolumeGrams > 0) {
      this.waterVolumeGrams = waterVolumeGrams;
    } else {
      throw ArgumentError();
    }

    //checking the name of the recipe
    if (name == null || name == "") {
      throw ArgumentError();
    } else {
      this.name = name;
    }

    //checking the grize size
    if (grindSize == null || grindSize == "") {
      throw ArgumentError();
    } else {
      this.grindSize = grindSize;
    }

    //checking the misc details
    if (miscDetails == null || miscDetails == "") {
      throw ArgumentError();
    } else {
      this.miscDetails = miscDetails;
    }

    //checking the step size
    if (steps.length < 1) {
      throw ArgumentError();
    } else {
      this.steps = steps;
    }
  }
}
