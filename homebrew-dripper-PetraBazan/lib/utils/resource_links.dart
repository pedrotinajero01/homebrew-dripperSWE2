import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/models/resource_linkList.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<ResourceLinks> links = [
  ResourceLinks(
      "Coffee", 'https://www.starbucks.com/menu/at-home-coffee/whole-bean'),
  ResourceLinks(
      "Coffee Dripper", 'https://prima-coffee.com/equipment/abid/clever'),
  ResourceLinks("Coffee Mugs",
      'https://www.target.com/c/coffee-mugs-tea-cups-glassware-drinkware-kitchen-dining/-/N-4yklc?Nao=0'),
  ResourceLinks("Coffee Grinders",
      'https://www.goodhousekeeping.com/appliances/coffee-maker-reviews/g30986295/best-coffee-grinders/')
];
