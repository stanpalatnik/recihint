import 'dart:async';
import 'dart:json' as json;
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:postgresql/postgresql_pool.dart';
import '../Models/Recipe.dart';

class RecipeController {
  static final _logger = LoggerFactory.getLogger("RecipeController");
  
  Future getRecipeById(Uri uri, Map config, Pool pool) {
    return    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
       yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" where id = @id;""";
      conn.query(query, {'id': 5})
      .toList()
      .map((row) => new Recipe(row.id, row.name, row.rating, row.totalTime, row.thumbnail, row.calories, 
          row.ingredientsList, row.yeild, row.serving, row.websitename, row.recipeurl))
      .then((List<Recipe> recipies) {
        json.stringify(recipies);
    });
    });  
  }
  
  Future getRecipeByName(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies based on score 
   */
  Future listRecipies(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies by category based on score 
   */
  Future listRecipiesByCategory(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}