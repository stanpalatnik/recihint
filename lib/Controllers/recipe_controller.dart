import 'dart:io';
import 'dart:async';
import 'dart:json' as json;
import 'package:postgresql/postgresql.dart';
import 'package:postgresql/postgresql_pool.dart';
import 'base_controller.dart' as Base;
import '../Models/recipe.dart';

class RecipeController extends Base.BaseController {
  
  RecipeController(pool, config) {}
  
  Future getRecipeById(HttpRequest request) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
          yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" where id = @id;""";
      conn.query(query, {'id': request.uri.queryParameters['id']})
      .then(completer.complete(generateRecipeReply)); 
    });   
    return completer.future;
  }
  
  Future getRecipeByName(HttpRequest request) {
var completer = new Completer();
    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
          yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" where name = @name;""";
      conn.query(query, {'id': request.uri.queryParameters['name']})
      .then(completer.complete(generateRecipeReply)); 
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies based on score 
   */
  Future listRecipies(HttpRequest request) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
          yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" ORDER BY RATING DESC LIMIT 100;""";
      conn.query(query)
      .toList().then(completer.complete(generateRecipeListReply));      
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies by category based on score 
   */
  Future listRecipiesByCategory(HttpRequest request) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
          yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" ORDER BY RATING DESC LIMIT 100;""";
      conn.query(query)
        .toList().then(completer.complete(generateRecipeListReply));     
    });
    
    return completer.future;
  }
  
  String generateRecipeReply(recipe) {
    return json.stringify(
        recipe.map((row) => 
            new Recipe(row.id, row.name, row.rating, row.totalTime, row.thumbnail, row.calories, 
                row.ingredientsList, row.yield, row.serving, row.websitename, row.recipeurl))
    );
  }
  
  String generateRecipeListReply(recipeList) {
    return json.stringify(
        recipeList.map((row) => 
            new Recipe(row.id, row.name, row.rating, row.totalTime, row.thumbnail, row.calories, 
                row.ingredientsList, row.yield, row.serving, row.websitename, row.recipeurl)).toList(growable: false)
    );
  }
}