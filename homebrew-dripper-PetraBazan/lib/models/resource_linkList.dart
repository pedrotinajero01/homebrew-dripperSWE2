//resource_linkList.dart
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class ResourceLinks {
  String name;
  String url;

  ResourceLinks(name, url) {
    //add any rules to reject invalid values
    //for example, reject null categories or null urls

    if (name == null || name == "") {
      //throws error if step is null or empty
      throw ArgumentError();
    } else {
      this.name = name;
    }

    if (url == null || url == "") {
      //throws error if step is null or empty
      throw ArgumentError();
    } else {
      this.url = url;
    }
  }
}
