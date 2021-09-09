import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    //steps, time
    String instruction = "Add 360g water";
    int ttime = 30;
    RecipeStep steps = RecipeStep(instruction, ttime);
    //List<RecipeStep> makestep = [RecipeStep(instruction,time)];
    expect(steps.text, "Add 360g water");
    expect(steps.time, 30);
    //check that it has the right data
  });

  //how do we test rejecting invalid recipe steps?
  test('creates an invalid recipe step', () {
    //make a recipe step
    //steps, time
    // valid recipe steps
    String instruction = "Add 360g water";
    int ttime = 30;

    //invalid recipe steps
    String wrongInstruction = "";
    int wrongTime = -1;

    expect(() => RecipeStep(wrongInstruction, ttime), throwsArgumentError);
    expect(() => RecipeStep(instruction, wrongTime), throwsArgumentError);
    //check that it has the right data
  });
}
