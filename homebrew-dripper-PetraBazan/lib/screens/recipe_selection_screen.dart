import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/resource_linkList.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/utils/resource_links.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ), //spacer
          Text("Coffee Recipes",
              key: Key("coffee-recipes"),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Kollektif",
              )),
          RecipeList(),
          SizedBox(height: 12), //spacer
          Text("Resources",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Kollektif",
              )),
          ResourceList()
        ],
      ),
    );
  }
}

// List of Recipes in the app
class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff4c748b), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent,
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(children: [
          for (CoffeeRecipe recipe in recipes)
            Column(children: [
              ListTile(
                title: Text(recipe.name),
                key: Key(recipe.name),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Color(0xff4c748b),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe)),
                  );
                },
              ),
              Divider(
                //Lines seperating recipe options
                color: Color(0xff4c748b),
                thickness: 2,
                height: 1,
              ),
            ])
        ]));
  }
}

// List of Resources in the app
class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff4c748b), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent,
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (ResourceLinks link in links)
              Column(children: [
                ListTile(
                    title: Text(link.name),
                    key: Key(link.name),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Color(0xff4c748b),
                    ),
                    onTap: () async {
                      //will open the resource links in resource_links.dart
                      if (await canLaunch(link.url)) {
                        await launch(link.url);
                      } else {
                        throw 'Could not launch ${link.url}';
                      }
                    }),
                Divider(
                  //Lines seperating resources' options
                  color: Color(0xff4c748b),
                  thickness: 2,
                  height: 1,
                ),
              ])
          ],
        ));
  }
}
