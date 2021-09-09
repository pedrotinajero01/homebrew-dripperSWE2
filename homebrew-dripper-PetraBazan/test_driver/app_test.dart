// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:async';

void main() {
// First, define the Finders and use them to locate widgets from the
  // test suite. Note: the Strings provided to the `byValueKey` method must
  // be the same as the Strings we used for the Keys in step 1.

  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  group('Happy Paths', () {
    group("Test Recipe", () {
      test('Selection Screen', () async {
        //final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
        await driver.waitFor(find.text("Coffee Recipes"));
        final recipeButton = find.byValueKey('Test Recipe');
        await driver.tap(recipeButton);
      });

      test('Details Screen', () async {
        final description = find.byValueKey("originalRecipe");
        final startButton = find.byValueKey("StartButton");

        expect(await driver.getText(description), "Testing, Testing, 123");

        final coffee = find.byValueKey("GramsofCoffee");
        expect(await driver.getText(coffee), "22g - finely ground coffee");
        final water = find.byValueKey("GramsofWater");
        expect(await driver.getText(water), "360g - water");
        await driver.tap(startButton);
      });

      test('Timer Screen', () async {
        final steps = find.byValueKey("steps");
        expect(await driver.getText(steps), " Steps");
        Future.delayed(const Duration(seconds: 5));
      });

      test('Done Screen', () async {
        final doneText = find.byValueKey("donetext");
        final doneButton = find.byValueKey("doneButton");
        expect(await driver.getText(doneText),
            "Enjoy your amazing \n handmade coffee");
        await driver.tap(doneButton);
      });
    });

    group("Second Test Recipe", () {
      test('Selection Screen', () async {
        //final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
        await driver.waitFor(find.text("Coffee Recipes"));
        final recipeButton = find.byValueKey("Another Test Recipe");
        await driver.tap(recipeButton);
      });

      test('Details Screen', () async {
        final description = find.byValueKey("originalRecipe");
        final startButton = find.byValueKey("StartButton");

        expect(await driver.getText(description), "TEST");

        final coffee = find.byValueKey("GramsofCoffee");
        expect(await driver.getText(coffee), "22g - finely ground coffee");
        final water = find.byValueKey("GramsofWater");
        expect(await driver.getText(water), "360g - water");
        await driver.tap(startButton);
      });

      test('Timer Screen', () async {
        final steps = find.byValueKey("steps");
        expect(await driver.getText(steps), " Steps");
        //put waiting code HERE
        Future.delayed(const Duration(seconds: 10));
      });

      test('Done Screen', () async {
        final doneText = find.byValueKey("donetext");
        final doneButton = find.byValueKey("doneButton");
        expect(await driver.getText(doneText),
            "Enjoy your amazing \n handmade coffee");
        await driver.tap(doneButton);
      });

      test("Back button", () async {
        final sweetM = find.byValueKey("Sweet Maria's");

        await driver.tap(sweetM);
        final detailScreen = find.byValueKey("originalRecipe");

        expect(await driver.getText(detailScreen),
            "The original recipe: makes one delicious cup");
        await driver.tap(find.byValueKey('BackButton'));

        final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
      });
    });
  });

  // +++++ Sad Paths is currently working, commenting to isolate Happy Paths +++++

  group('Sad Paths', () {
    //final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');
    test('should not advance if time has not finished', () async {
      //make sure we are on selection screen
      await driver.waitFor(find.text("Coffee Recipes"));
      final recipeButton = find.byValueKey("Test Recipe");
      await driver.tap(recipeButton);

      //advance to detail screen
      final description = find.byValueKey("originalRecipe");
      final startButton = find.byValueKey("StartButton");
      expect(await driver.getText(description), "Testing, Testing, 123");
      final coffee = find.byValueKey("GramsofCoffee");
      expect(await driver.getText(coffee), "22g - finely ground coffee");
      final water = find.byValueKey("GramsofWater");
      expect(await driver.getText(water), "360g - water");
      await driver.tap(startButton);

      //check that the app does not advance to done screen if time isn't over
      final steps = find.byValueKey("steps");
      expect(await driver.getText(steps), " Steps");
      Future.delayed(const Duration(seconds: 3));
      //this line is expecting the text "steps" because the timer should still be going
      expect(await driver.getText(steps), " Steps");
    });
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
}
