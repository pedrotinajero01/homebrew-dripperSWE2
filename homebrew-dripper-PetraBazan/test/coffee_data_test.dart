//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/models/resource_linkList.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/utils/resource_links.dart';

void main() {
  group("Recipes should give back correct results", () {
    test("loadRecipes should give back the Sweet Maria's recipe in my app", () {
      List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

      // add whatever tests help give you confidence
      expect(recipes[0], isA<CoffeeRecipe>());
      expect(recipes[0].name, "Sweet Maria's");
      expect(recipes[0].steps, isA<List<RecipeStep>>());
      expect(recipes[0].coffeeVolumeGrams, 22);
      expect(recipes[0].waterVolumeGrams, 360);
      expect(recipes[0].miscDetails,
          "The original recipe: makes one delicious cup");
      expect(recipes[0].grindSize, "finely ground coffee");
    });

    test("loadRecipes should give back the TestRecipe recipe in my app", () {
      List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

      expect(recipes[1], isA<CoffeeRecipe>());
      expect(recipes[1].name, "Test Recipe");
      expect(recipes[1].steps, isA<List<RecipeStep>>());
      expect(recipes[1].coffeeVolumeGrams, 22);
      expect(recipes[1].waterVolumeGrams, 360);
      expect(recipes[1].miscDetails, "Testing, Testing, 123");
      expect(recipes[1].grindSize, "finely ground coffee");
    });

    test("loadRecipes should give back the PT's recipe in my app", () {
      List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

      expect(recipes[2], isA<CoffeeRecipe>());
      expect(recipes[2].name, "PT's");
      expect(recipes[2].steps, isA<List<RecipeStep>>());
      expect(recipes[2].coffeeVolumeGrams, 25);
      expect(recipes[2].waterVolumeGrams, 450);
      expect(
          recipes[2].miscDetails, "Recipe from the famous Pedro Tinajero ;)");
      expect(recipes[2].grindSize, "medium-coarse");
    });

    test("loadRecipes should give back the Texas Coffe School recipe in my app",
        () {
      List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

      expect(recipes[3], isA<CoffeeRecipe>());
      expect(recipes[3].name, "Texas Coffee School");
      expect(recipes[3].steps, isA<List<RecipeStep>>());
      expect(recipes[3].coffeeVolumeGrams, 24);
      expect(recipes[3].waterVolumeGrams, 340);
      expect(recipes[3].miscDetails, "Don't Mess with Texas!! >:(");
      expect(recipes[3].grindSize, "finely ground coffee");
    });

    test("loadRecipes should give back the Homegrounds recipe in my app", () {
      List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

      expect(recipes[4], isA<CoffeeRecipe>());
      expect(recipes[4].name, "Homegrounds");
      expect(recipes[4].steps, isA<List<RecipeStep>>());
      expect(recipes[4].coffeeVolumeGrams, 23);
      expect(recipes[4].waterVolumeGrams, 345);
      expect(recipes[4].miscDetails, "Not your average Home(Grounds)");
      expect(recipes[4].grindSize, "finely ground coffee");
    });
  });

  test("loadRecipes should give back the TestRecipe recipe in my app", () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    expect(recipes[5], isA<CoffeeRecipe>());
    expect(recipes[5].name, "Another Test Recipe");
    expect(recipes[5].steps, isA<List<RecipeStep>>());
    expect(recipes[5].coffeeVolumeGrams, 22);
    expect(recipes[5].waterVolumeGrams, 360);
    expect(recipes[5].miscDetails, "TEST");
    expect(recipes[5].grindSize, "finely ground coffee");
  });

  group("Testing our own tools & resource links", () {
    test("toMinuteFormat", () {
      expect(toMinuteFormat(05), "00:05");
      expect(toMinuteFormat(32), "00:32");
      expect(toMinuteFormat(240), "04:00");
      expect(toMinuteFormat(245), "04:05");
      expect(toMinuteFormat(260), "04:20");
      expect(toMinuteFormat(660), "11:00");
      expect(toMinuteFormat(665), "11:05");
      expect(toMinuteFormat(680), "11:20");
    });

    test("TotalTime", () {
      List<RecipeStep> tlist = [RecipeStep("one", 120), RecipeStep("two", 120)];
      expect(
          totalTime(
              CoffeeRecipe("testTotalTime", 20, 50, "Grindr", "recipe", tlist)),
          "04:00");
      List<RecipeStep> tlist2 = [
        RecipeStep("one", 300),
        RecipeStep("two", 300),
        RecipeStep('three', 60),
        RecipeStep('four', 5)
      ];
      expect(
          totalTime(CoffeeRecipe(
              "testTotalTime", 20, 50, "Grindr", "recipe", tlist2)),
          "11:05");
    });

    test("Resource names & links", () {
      List<ResourceLinks> testResources = links;
      expect(testResources[0].name, "Coffee");
      expect(testResources[0].url,
          'https://www.starbucks.com/menu/at-home-coffee/whole-bean');
      expect(testResources[1].name, "Coffee Dripper");
      expect(testResources[1].url,
          'https://prima-coffee.com/equipment/abid/clever');
      expect(testResources[2].name, "Coffee Mugs");
      expect(testResources[2].url,
          "https://www.target.com/c/coffee-mugs-tea-cups-glassware-drinkware-kitchen-dining/-/N-4yklc?Nao=0");
      expect(testResources[3].name, "Coffee Grinders");
      expect(testResources[3].url,
          "https://www.goodhousekeeping.com/appliances/coffee-maker-reviews/g30986295/best-coffee-grinders/");
    });
  });
}
