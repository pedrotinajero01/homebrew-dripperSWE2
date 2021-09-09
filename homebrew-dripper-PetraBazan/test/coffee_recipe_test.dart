import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    String tName = "test";
    int tCoffee = 1;
    int tWater = 2;
    String tGrind = "testly";
    String tDet = "test recipe";
    List<RecipeStep> tList = [RecipeStep("good text", 10)];
    CoffeeRecipe tRecipe =
        CoffeeRecipe(tName, tCoffee, tWater, tGrind, tDet, tList);
    //check that it has the right data
    expect(tRecipe.name, tName);
    expect(tRecipe.coffeeVolumeGrams, tCoffee);
    expect(tRecipe.waterVolumeGrams, tWater);
    expect(tRecipe.grindSize, tGrind);
    expect(tRecipe.miscDetails, tDet);
    expect(tRecipe.steps, tList);
  });

  //how do we test rejecting invalid coffee recipes?
  test('creates an invalid coffee recipe', () {
    //make a coffee recipe
    // valid recipe
    String tName = "test";
    int tCoffee = 1;
    int tWater = 2;
    String tGrind = "testly";
    String tDet = "test recipe";
    List<RecipeStep> tList = [RecipeStep("good text", 10)];

    // invalid recipe
    String wrongName = "";
    int wrongCoffee = -1;
    int wrongWater = -2;
    String wrongGrind = "";
    String wrongDet = "";
    List<RecipeStep> wrongList = [];

    // //check that it has the right data
    expect(() => CoffeeRecipe(wrongName, tCoffee, tWater, tGrind, tDet, tList),
        throwsArgumentError);
    expect(() => CoffeeRecipe(tName, wrongCoffee, tWater, tGrind, tDet, tList),
        throwsArgumentError);
    expect(() => CoffeeRecipe(tName, tCoffee, wrongWater, tGrind, tDet, tList),
        throwsArgumentError);
    expect(() => CoffeeRecipe(tName, tCoffee, tWater, wrongGrind, tDet, tList),
        throwsArgumentError);
    expect(() => CoffeeRecipe(tName, tCoffee, tWater, tGrind, wrongDet, tList),
        throwsArgumentError);
    expect(() => CoffeeRecipe(tName, tCoffee, tWater, tGrind, tDet, wrongList),
        throwsArgumentError);
  });
}
