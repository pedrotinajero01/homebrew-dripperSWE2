//recipe_step.dart
class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative time or null steps

    if (text == null || text == "") {
      //throws error if step is null or empty
      throw ArgumentError();
    } else {
      this.text = text;
    }

    if (time < 0) {
      //throws error if time is negative
      throw ArgumentError();
    } else {
      this.time = time;
    }
  }
}
